// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      userType: $enumDecode(_$UserTypeEnumMap, json['user_type']),
      isVisuallyImpaired: json['is_visually_impaired'] as bool,
      impairmentLevel: $enumDecode(
        _$ImpairmentLevelEnumMap,
        json['impairment_level'],
      ),
      isOnboardingCompleted: json['is_onboarding_completed'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastLoginAt: json['last_login_at'] == null
          ? null
          : DateTime.parse(json['last_login_at'] as String),
      profileImageUrl: json['profile_image_url'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'user_type': _$UserTypeEnumMap[instance.userType]!,
      'is_visually_impaired': instance.isVisuallyImpaired,
      'impairment_level': _$ImpairmentLevelEnumMap[instance.impairmentLevel]!,
      'is_onboarding_completed': instance.isOnboardingCompleted,
      'created_at': instance.createdAt.toIso8601String(),
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'profile_image_url': instance.profileImageUrl,
    };

const _$UserTypeEnumMap = {
  UserType.mainUser: 'MAIN_USER',
  UserType.companion: 'COMPANION',
};

const _$ImpairmentLevelEnumMap = {
  ImpairmentLevel.totalBlindness: 'TOTAL_BLINDNESS',
  ImpairmentLevel.lowVision: 'LOW_VISION',
  ImpairmentLevel.none: 'NONE',
};
