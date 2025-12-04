import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// Visual impairment severity level
enum DisabilitySeverity {
  @JsonValue('TOTAL_BLINDNESS')
  totalBlindness,
  @JsonValue('LOW_VISION')
  lowVision,
  @JsonValue('NONE')
  none,
}

/// User entity representing the authenticated user
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String name,
    required bool isVisuallyImpaired,
    required DisabilitySeverity disabilitySeverity,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    String? profileImageUrl,
    String? bio,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

/// Extension for user-related helper methods
extension UserEntityX on UserEntity {
  /// Check if user requires TTS feedback
  bool get requiresTts => isVisuallyImpaired;

  /// Check if user has total blindness
  bool get isTotallyBlind =>
      disabilitySeverity == DisabilitySeverity.totalBlindness;

  /// Check if user has low vision
  bool get hasLowVision => disabilitySeverity == DisabilitySeverity.lowVision;

  /// Get display name with fallback
  String get displayName => name.isEmpty ? email.split('@').first : name;
}
