import 'package:equatable/equatable.dart';

class PromotionEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final String? ctaText;
  final String? ctaRoute;

  const PromotionEntity({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    this.ctaText,
    this.ctaRoute,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    ctaText,
    ctaRoute,
  ];
}
