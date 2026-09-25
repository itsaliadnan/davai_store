import 'package:davai_store/core/data/providers/dio_client_provider.dart';
import 'package:davai_store/core/data/repo/settings_repo.dart';
import 'package:davai_store/features/profile/data/model/delivery_zone_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// =========================================================
// REPOSITORY
// =========================================================

final settingsRepositoryProvider = Provider(
  (ref) => SettingsRepository(ref.read(dioClientProvider)),
);

// =========================================================
// DEFAULT DELIVERY FEE (fallback)
// =========================================================

final defaultDeliveryFeeProvider = FutureProvider<double>((ref) async {
  return ref.read(settingsRepositoryProvider).getDefaultDeliveryFee();
});

// =========================================================
// DELIVERY ZONES LIST
// =========================================================

final deliveryZonesProvider = FutureProvider<List<DeliveryZoneModel>>((ref) {
  return ref.read(settingsRepositoryProvider).getActiveZones();
});

// =========================================================
// SELECTED ZONE (محفوظة محليًا بالجهاز)
// =========================================================

final selectedZoneIdProvider =
    AsyncNotifierProvider<SelectedZoneController, int?>(
      SelectedZoneController.new,
    );

class SelectedZoneController extends AsyncNotifier<int?> {
  static const _prefsKey = 'selected_delivery_zone_id';

  @override
  Future<int?> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_prefsKey);
  }

  Future<void> selectZone(int zoneId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, zoneId);
    state = AsyncData(zoneId);
  }
}

// =========================================================
// EFFECTIVE DELIVERY FEE (منطقة محددة، أو الرسوم الافتراضية)
// =========================================================

final effectiveDeliveryFeeProvider = FutureProvider<double>((ref) async {
  final selectedZoneId = await ref.watch(selectedZoneIdProvider.future);

  if (selectedZoneId != null) {
    final zones = await ref.watch(deliveryZonesProvider.future);
    final zone = zones.where((z) => z.id == selectedZoneId).firstOrNull;

    if (zone != null) return zone.fee;
  }

  return ref.watch(defaultDeliveryFeeProvider.future);
});
