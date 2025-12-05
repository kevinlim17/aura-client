import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';
part 'profile_entity.g.dart';

/// User profile entity
/// Matches API response for /api/users/{userId}/profile
@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required int id,
    required int userId,
    required List<String> interests,
    required String hobbies,
    String? hobbiesVoiceUrl,
    required List<String> favoriteArtists,
    required String bio,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProfileEntity;

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
}

/// Profile creation/update request
@freezed
class ProfileRequest with _$ProfileRequest {
  const factory ProfileRequest({
    required List<String> interests,
    required String hobbies,
    String? hobbiesVoiceUrl,
    required List<String> favoriteArtists,
    required String bio,
  }) = _ProfileRequest;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);
}