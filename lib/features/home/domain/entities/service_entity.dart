import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String iconName;
  final String? badge;

  final bool isDark;

  const ServiceEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconName,
    this.badge,
    this.isDark = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    iconName,
    badge,
    isDark,
  ];
}
