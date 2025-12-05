// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesResponseImpl _$$PreferencesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PreferencesResponseImpl(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  narrativeStyle: json['narrativeStyle'] as String,
  preferredLength: json['preferredLength'] as String,
  ttsSpeed: (json['ttsSpeed'] as num).toDouble(),
  ttsPitch: (json['ttsPitch'] as num).toDouble(),
  ttsVoice: json['ttsVoice'] as String,
  preferredLanguage: json['preferredLanguage'] as String,
  enableHapticFeedback: json['enableHapticFeedback'] as bool,
  enableAudioDescriptions: json['enableAudioDescriptions'] as bool,
  highContrastMode: json['highContrastMode'] as bool,
  enablePushNotifications: json['enablePushNotifications'] as bool,
  isVisuallyImpaired: json['isVisuallyImpaired'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$PreferencesResponseImplToJson(
  _$PreferencesResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'narrativeStyle': instance.narrativeStyle,
  'preferredLength': instance.preferredLength,
  'ttsSpeed': instance.ttsSpeed,
  'ttsPitch': instance.ttsPitch,
  'ttsVoice': instance.ttsVoice,
  'preferredLanguage': instance.preferredLanguage,
  'enableHapticFeedback': instance.enableHapticFeedback,
  'enableAudioDescriptions': instance.enableAudioDescriptions,
  'highContrastMode': instance.highContrastMode,
  'enablePushNotifications': instance.enablePushNotifications,
  'isVisuallyImpaired': instance.isVisuallyImpaired,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_$PreferencesApiResponseImpl _$$PreferencesApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PreferencesApiResponseImpl(
  success: json['success'] as bool,
  data: PreferencesResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$PreferencesApiResponseImplToJson(
  _$PreferencesApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
