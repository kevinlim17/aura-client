// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileEntityImpl _$$ProfileEntityImplFromJson(Map<String, dynamic> json) =>
    _$ProfileEntityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      interests: (json['interests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hobbies: json['hobbies'] as String,
      hobbiesVoiceUrl: json['hobbiesVoiceUrl'] as String?,
      favoriteArtists: (json['favoriteArtists'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bio: json['bio'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProfileEntityImplToJson(_$ProfileEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'interests': instance.interests,
      'hobbies': instance.hobbies,
      'hobbiesVoiceUrl': instance.hobbiesVoiceUrl,
      'favoriteArtists': instance.favoriteArtists,
      'bio': instance.bio,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ProfileRequestImpl _$$ProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProfileRequestImpl(
      interests: (json['interests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hobbies: json['hobbies'] as String,
      hobbiesVoiceUrl: json['hobbiesVoiceUrl'] as String?,
      favoriteArtists: (json['favoriteArtists'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$$ProfileRequestImplToJson(
  _$ProfileRequestImpl instance,
) => <String, dynamic>{
  'interests': instance.interests,
  'hobbies': instance.hobbies,
  'hobbiesVoiceUrl': instance.hobbiesVoiceUrl,
  'favoriteArtists': instance.favoriteArtists,
  'bio': instance.bio,
};
