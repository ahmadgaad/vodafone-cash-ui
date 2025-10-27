import '../../domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.iconName,
    super.badge,
    super.isDark,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      iconName: json['icon_name'] as String,
      badge: json['badge'] as String?,
      isDark: json['is_dark'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'icon_name': iconName,
      'badge': badge,
      'is_dark': isDark,
    };
  }
}
