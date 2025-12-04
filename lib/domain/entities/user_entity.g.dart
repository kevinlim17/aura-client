// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      isVisuallyImpaired: json['isVisuallyImpaired'] as bool,
      disabilitySeverity: $enumDecode(
        _$DisabilitySeverityEnumMap,
        json['disabilitySeverity'],
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'isVisuallyImpaired': instance.isVisuallyImpaired,
      'disabilitySeverity':
          _$DisabilitySeverityEnumMap[instance.disabilitySeverity]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'bio': instance.bio,
    };

const _$DisabilitySeverityEnumMap = {
  DisabilitySeverity.totalBlindness: 'TOTAL_BLINDNESS',
  DisabilitySeverity.lowVision: 'LOW_VISION',
  DisabilitySeverity.none: 'NONE',
};
