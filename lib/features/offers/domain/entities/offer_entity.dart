import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final String? imageUrl;
  final String ctaText;
  final bool isFeatured;

  const OfferEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.imageUrl,
    required this.ctaText,
    this.isFeatured = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    imageUrl,
    ctaText,
    isFeatured,
  ];
}
