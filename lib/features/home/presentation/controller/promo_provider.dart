import 'package:davai_store/core/data/providers/dio_client_provider.dart';
import 'package:davai_store/features/home/data/model/promo_model.dart';
import 'package:davai_store/features/home/data/repo/promo_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final promoRepositoryProvider = Provider<PromoRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return PromoRepository(dioClient.rest);
});

final promosProvider = FutureProvider<List<PromoModel>>((ref) async {
  final repo = ref.read(promoRepositoryProvider);
  return repo.getPromos();
});
