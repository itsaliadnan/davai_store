// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../network/dio_client.dart';

// class StorageService {
//   final Dio dio;

//   StorageService(DioClient client) : dio = client.storage;

//   Future<String> uploadImage({
//     required File file,
//     required String fileName,
//   }) async {
//     final bytes = await file.readAsBytes();

//     final response = await dio.post(
//       'object/avatars/$fileName',
//       data: bytes,
//       options: Options(headers: {'Content-Type': 'image/png'}),
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return _getPublicUrl(fileName);
//     } else {
//       throw Exception('Upload failed');
//     }
//   }

//   String _getPublicUrl(String fileName) {
//     return 'https://fkojngejmyyujpvcvhsr.supabase.co/storage/v1/object/public/avatars/$fileName';
//   }
// }
