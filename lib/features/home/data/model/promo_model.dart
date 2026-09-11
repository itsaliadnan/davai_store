class PromoModel {
  final int id;
  final String title;
  final String? description;
  final String image;
  final bool isActive;
  final DateTime? startDate;
  final DateTime? endDate;
  final int priority;
  final String? type;

  PromoModel({
    required this.id,
    required this.title,
    this.description,
    required this.image,
    required this.isActive,
    this.startDate,
    this.endDate,
    required this.priority,
    this.type,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
      priority: json['priority'] ?? 0,
      type: json['type'],
    );
  }
}
