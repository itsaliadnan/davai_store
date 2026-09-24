import 'package:davai_store/core/network/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio restDio;
  final Dio functionsDio;

  DioClient()
    : restDio = Dio(
        BaseOptions(
          baseUrl: 'https://fkojngejmyyujpvcvhsr.supabase.co/rest/v1/',
          headers: {
            'apikey':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZrb2puZ2VqbXl5dWpwdmN2aHNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODUzODk2MjAsImV4cCI6MjEwMDk2NTYyMH0.hNQExN3Oqy4jToEo0fDWg_JDOhlRuHGtp2MgloKTZRA',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZrb2puZ2VqbXl5dWpwdmN2aHNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODUzODk2MjAsImV4cCI6MjEwMDk2NTYyMH0.hNQExN3Oqy4jToEo0fDWg_JDOhlRuHGtp2MgloKTZRA',
            'Prefer': 'return=representation',
          },
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
      functionsDio = Dio(
        BaseOptions(
          baseUrl: 'https://fkojngejmyyujpvcvhsr.supabase.co/functions/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ) {
    // ============================================================
    // Logging
    // ============================================================

    final logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    restDio.interceptors.add(logInterceptor);
    functionsDio.interceptors.add(logInterceptor);

    // ============================================================
    // Mobile Session Token
    // functionsDio
    // ============================================================

    final authInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isLoginRequest =
            options.path.endsWith('/login') || options.path == 'login';

        if (!isLoginRequest) {
          final prefs = await SharedPreferences.getInstance();

          final sessionToken = prefs.getString('sessionToken');

          if (sessionToken != null && sessionToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $sessionToken';
          }
        }

        handler.next(options);
      },
    );

    functionsDio.interceptors.add(authInterceptor);

    // ============================================================
    // Error Handling
    // ============================================================

    final errorInterceptor = InterceptorsWrapper(
      onError: (e, handler) {
        final responseData = e.response?.data;

        String message = 'Server error';

        if (responseData is Map) {
          message =
              responseData['error']?.toString() ??
              responseData['message']?.toString() ??
              'Server error';
        } else if (responseData is String && responseData.isNotEmpty) {
          message = responseData;
        }

        handler.reject(
          DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: ApiException(message),
          ),
        );
      },
    );

    restDio.interceptors.add(errorInterceptor);
    functionsDio.interceptors.add(errorInterceptor);
  }

  Dio get rest => restDio;

  Dio get functions => functionsDio;
}
