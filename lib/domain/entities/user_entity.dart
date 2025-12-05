import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// User type as defined by the API
enum UserType {
  @JsonValue('MAIN_USER')
  mainUser,
  @JsonValue('COMPANION')
  companion,
}

/// Visual impairment level as defined by the API
enum ImpairmentLevel {
  @JsonValue('TOTAL_BLINDNESS')
  totalBlindness,
  @JsonValue('LOW_VISION')
  lowVision,
  @JsonValue('NONE') // Added for non-impaired users
  none,
}

/// User entity representing the authenticated user
@freezed
class UserEntity with _$UserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserEntity({
    required String id,
    required String email,
    String? name, // Name is not returned from register endpoint
    required UserType userType,
    required bool isVisuallyImpaired,
    required ImpairmentLevel impairmentLevel,
    required bool isOnboardingCompleted,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    String? profileImageUrl,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

/// Extension for user-related helper methods
extension UserEntityX on UserEntity {
  /// Check if user requires TTS feedback
  bool get requiresTts => isVisuallyImpaired;

  /// Get display name with fallback
  String get displayName => name ?? email.split('@').first;
}
