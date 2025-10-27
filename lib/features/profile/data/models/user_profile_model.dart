import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.name,
    required super.phoneNumber,
    super.email,
    required super.appVersion,
    super.isLatestVersion,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      appVersion: json['app_version'] as String,
      isLatestVersion: json['is_latest_version'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'app_version': appVersion,
      'is_latest_version': isLatestVersion,
    };
  }
}
