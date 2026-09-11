import 'package:davai_store/core/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());
