import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesController extends StateNotifier<List<int>> {
  FavoritesController() : super([]);

  /// إضافة / إزالة من المفضلة
  void toggleFavorite(int productId) {
    if (state.contains(productId)) {
      state = state.where((id) => id != productId).toList();
    } else {
      state = [...state, productId];
    }
  }

  /// حذف عنصر واحد
  void removeFavorite(int productId) {
    state = state.where((id) => id != productId).toList();
  }

  /// تفريغ الكل
  void clearFavorites() {
    state = [];
  }

  /// التحقق إذا المنتج مفضل
  bool isFavorite(int productId) {
    return state.contains(productId);
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesController, List<int>>(
  (ref) => FavoritesController(),
);
