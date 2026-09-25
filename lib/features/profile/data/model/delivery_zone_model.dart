class DeliveryZoneModel {
  final int id;
  final String name;
  final double fee;

  const DeliveryZoneModel({
    required this.id,
    required this.name,
    required this.fee,
  });

  factory DeliveryZoneModel.fromJson(Map<String, dynamic> json) {
    return DeliveryZoneModel(
      id: json['id'] as int,
      name: json['name']?.toString() ?? '',
      fee: (json['fee'] as num?)?.toDouble() ?? 0,
    );
  }
}
