import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String name;
  final String phoneNumber;
  final String? email;
  final String appVersion;
  final bool isLatestVersion;

  const UserProfileEntity({
    required this.name,
    required this.phoneNumber,
    this.email,
    required this.appVersion,
    this.isLatestVersion = true,
  });

  @override
  List<Object?> get props => [
    name,
    phoneNumber,
    email,
    appVersion,
    isLatestVersion,
  ];
}
