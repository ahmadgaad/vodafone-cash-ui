import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String type;
  final DateTime timestamp;
  final bool isRead;
  final String? imageUrl;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    type,
    timestamp,
    isRead,
    imageUrl,
  ];
}
