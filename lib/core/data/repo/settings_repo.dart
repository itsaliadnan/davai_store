import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/features/profile/data/model/delivery_zone_model.dart';

class SettingsRepository {
  final DioClient dioClient;

  SettingsRepository(this.dioClient);

  Future<double> getDefaultDeliveryFee() async {
    try {
      final response = await dioClient.rest.get(
        'app_settings?select=default_delivery_fee&id=eq.1',
      );

      if (response.data is! List || (response.data as List).isEmpty) {
        return 0.0;
      }

      final row = (response.data as List).first as Map<String, dynamic>;
      return (row['default_delivery_fee'] as num?)?.toDouble() ?? 0.0;
    } catch (_) {
      return 0.0;
    }
  }

  Future<List<DeliveryZoneModel>> getActiveZones() async {
    try {
      final response = await dioClient.rest.get(
        'delivery_zones?select=id,name,fee&is_active=eq.true&order=name.asc',
      );

      if (response.data is! List) return [];

      return (response.data as List)
          .map(
            (item) =>
                DeliveryZoneModel.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    } catch (_) {
      return [];
    }
  }
}
