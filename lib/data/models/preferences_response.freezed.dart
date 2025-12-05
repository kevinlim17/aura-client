// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreferencesResponse _$PreferencesResponseFromJson(Map<String, dynamic> json) {
  return _PreferencesResponse.fromJson(json);
}

/// @nodoc
mixin _$PreferencesResponse {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get narrativeStyle => throw _privateConstructorUsedError;
  String get preferredLength => throw _privateConstructorUsedError;
  double get ttsSpeed => throw _privateConstructorUsedError;
  double get ttsPitch => throw _privateConstructorUsedError;
  String get ttsVoice => throw _privateConstructorUsedError;
  String get preferredLanguage => throw _privateConstructorUsedError;
  bool get enableHapticFeedback => throw _privateConstructorUsedError;
  bool get enableAudioDescriptions => throw _privateConstructorUsedError;
  bool get highContrastMode => throw _privateConstructorUsedError;
  bool get enablePushNotifications => throw _privateConstructorUsedError;
  bool get isVisuallyImpaired => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PreferencesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesResponseCopyWith<PreferencesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesResponseCopyWith<$Res> {
  factory $PreferencesResponseCopyWith(
    PreferencesResponse value,
    $Res Function(PreferencesResponse) then,
  ) = _$PreferencesResponseCopyWithImpl<$Res, PreferencesResponse>;
  @useResult
  $Res call({
    int id,
    int userId,
    String narrativeStyle,
    String preferredLength,
    double ttsSpeed,
    double ttsPitch,
    String ttsVoice,
    String preferredLanguage,
    bool enableHapticFeedback,
    bool enableAudioDescriptions,
    bool highContrastMode,
    bool enablePushNotifications,
    bool isVisuallyImpaired,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$PreferencesResponseCopyWithImpl<$Res, $Val extends PreferencesResponse>
    implements $PreferencesResponseCopyWith<$Res> {
  _$PreferencesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? narrativeStyle = null,
    Object? preferredLength = null,
    Object? ttsSpeed = null,
    Object? ttsPitch = null,
    Object? ttsVoice = null,
    Object? preferredLanguage = null,
    Object? enableHapticFeedback = null,
    Object? enableAudioDescriptions = null,
    Object? highContrastMode = null,
    Object? enablePushNotifications = null,
    Object? isVisuallyImpaired = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            narrativeStyle: null == narrativeStyle
                ? _value.narrativeStyle
                : narrativeStyle // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredLength: null == preferredLength
                ? _value.preferredLength
                : preferredLength // ignore: cast_nullable_to_non_nullable
                      as String,
            ttsSpeed: null == ttsSpeed
                ? _value.ttsSpeed
                : ttsSpeed // ignore: cast_nullable_to_non_nullable
                      as double,
            ttsPitch: null == ttsPitch
                ? _value.ttsPitch
                : ttsPitch // ignore: cast_nullable_to_non_nullable
                      as double,
            ttsVoice: null == ttsVoice
                ? _value.ttsVoice
                : ttsVoice // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredLanguage: null == preferredLanguage
                ? _value.preferredLanguage
                : preferredLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableAudioDescriptions: null == enableAudioDescriptions
                ? _value.enableAudioDescriptions
                : enableAudioDescriptions // ignore: cast_nullable_to_non_nullable
                      as bool,
            highContrastMode: null == highContrastMode
                ? _value.highContrastMode
                : highContrastMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            enablePushNotifications: null == enablePushNotifications
                ? _value.enablePushNotifications
                : enablePushNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVisuallyImpaired: null == isVisuallyImpaired
                ? _value.isVisuallyImpaired
                : isVisuallyImpaired // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreferencesResponseImplCopyWith<$Res>
    implements $PreferencesResponseCopyWith<$Res> {
  factory _$$PreferencesResponseImplCopyWith(
    _$PreferencesResponseImpl value,
    $Res Function(_$PreferencesResponseImpl) then,
  ) = __$$PreferencesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    String narrativeStyle,
    String preferredLength,
    double ttsSpeed,
    double ttsPitch,
    String ttsVoice,
    String preferredLanguage,
    bool enableHapticFeedback,
    bool enableAudioDescriptions,
    bool highContrastMode,
    bool enablePushNotifications,
    bool isVisuallyImpaired,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$PreferencesResponseImplCopyWithImpl<$Res>
    extends _$PreferencesResponseCopyWithImpl<$Res, _$PreferencesResponseImpl>
    implements _$$PreferencesResponseImplCopyWith<$Res> {
  __$$PreferencesResponseImplCopyWithImpl(
    _$PreferencesResponseImpl _value,
    $Res Function(_$PreferencesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? narrativeStyle = null,
    Object? preferredLength = null,
    Object? ttsSpeed = null,
    Object? ttsPitch = null,
    Object? ttsVoice = null,
    Object? preferredLanguage = null,
    Object? enableHapticFeedback = null,
    Object? enableAudioDescriptions = null,
    Object? highContrastMode = null,
    Object? enablePushNotifications = null,
    Object? isVisuallyImpaired = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PreferencesResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        narrativeStyle: null == narrativeStyle
            ? _value.narrativeStyle
            : narrativeStyle // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredLength: null == preferredLength
            ? _value.preferredLength
            : preferredLength // ignore: cast_nullable_to_non_nullable
                  as String,
        ttsSpeed: null == ttsSpeed
            ? _value.ttsSpeed
            : ttsSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        ttsPitch: null == ttsPitch
            ? _value.ttsPitch
            : ttsPitch // ignore: cast_nullable_to_non_nullable
                  as double,
        ttsVoice: null == ttsVoice
            ? _value.ttsVoice
            : ttsVoice // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredLanguage: null == preferredLanguage
            ? _value.preferredLanguage
            : preferredLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableAudioDescriptions: null == enableAudioDescriptions
            ? _value.enableAudioDescriptions
            : enableAudioDescriptions // ignore: cast_nullable_to_non_nullable
                  as bool,
        highContrastMode: null == highContrastMode
            ? _value.highContrastMode
            : highContrastMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        enablePushNotifications: null == enablePushNotifications
            ? _value.enablePushNotifications
            : enablePushNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVisuallyImpaired: null == isVisuallyImpaired
            ? _value.isVisuallyImpaired
            : isVisuallyImpaired // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesResponseImpl extends _PreferencesResponse {
  const _$PreferencesResponseImpl({
    required this.id,
    required this.userId,
    required this.narrativeStyle,
    required this.preferredLength,
    required this.ttsSpeed,
    required this.ttsPitch,
    required this.ttsVoice,
    required this.preferredLanguage,
    required this.enableHapticFeedback,
    required this.enableAudioDescriptions,
    required this.highContrastMode,
    required this.enablePushNotifications,
    required this.isVisuallyImpaired,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  factory _$PreferencesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String narrativeStyle;
  @override
  final String preferredLength;
  @override
  final double ttsSpeed;
  @override
  final double ttsPitch;
  @override
  final String ttsVoice;
  @override
  final String preferredLanguage;
  @override
  final bool enableHapticFeedback;
  @override
  final bool enableAudioDescriptions;
  @override
  final bool highContrastMode;
  @override
  final bool enablePushNotifications;
  @override
  final bool isVisuallyImpaired;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PreferencesResponse(id: $id, userId: $userId, narrativeStyle: $narrativeStyle, preferredLength: $preferredLength, ttsSpeed: $ttsSpeed, ttsPitch: $ttsPitch, ttsVoice: $ttsVoice, preferredLanguage: $preferredLanguage, enableHapticFeedback: $enableHapticFeedback, enableAudioDescriptions: $enableAudioDescriptions, highContrastMode: $highContrastMode, enablePushNotifications: $enablePushNotifications, isVisuallyImpaired: $isVisuallyImpaired, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.narrativeStyle, narrativeStyle) ||
                other.narrativeStyle == narrativeStyle) &&
            (identical(other.preferredLength, preferredLength) ||
                other.preferredLength == preferredLength) &&
            (identical(other.ttsSpeed, ttsSpeed) ||
                other.ttsSpeed == ttsSpeed) &&
            (identical(other.ttsPitch, ttsPitch) ||
                other.ttsPitch == ttsPitch) &&
            (identical(other.ttsVoice, ttsVoice) ||
                other.ttsVoice == ttsVoice) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(
                  other.enableAudioDescriptions,
                  enableAudioDescriptions,
                ) ||
                other.enableAudioDescriptions == enableAudioDescriptions) &&
            (identical(other.highContrastMode, highContrastMode) ||
                other.highContrastMode == highContrastMode) &&
            (identical(
                  other.enablePushNotifications,
                  enablePushNotifications,
                ) ||
                other.enablePushNotifications == enablePushNotifications) &&
            (identical(other.isVisuallyImpaired, isVisuallyImpaired) ||
                other.isVisuallyImpaired == isVisuallyImpaired) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    narrativeStyle,
    preferredLength,
    ttsSpeed,
    ttsPitch,
    ttsVoice,
    preferredLanguage,
    enableHapticFeedback,
    enableAudioDescriptions,
    highContrastMode,
    enablePushNotifications,
    isVisuallyImpaired,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesResponseImplCopyWith<_$PreferencesResponseImpl> get copyWith =>
      __$$PreferencesResponseImplCopyWithImpl<_$PreferencesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesResponseImplToJson(this);
  }
}

abstract class _PreferencesResponse extends PreferencesResponse {
  const factory _PreferencesResponse({
    required final int id,
    required final int userId,
    required final String narrativeStyle,
    required final String preferredLength,
    required final double ttsSpeed,
    required final double ttsPitch,
    required final String ttsVoice,
    required final String preferredLanguage,
    required final bool enableHapticFeedback,
    required final bool enableAudioDescriptions,
    required final bool highContrastMode,
    required final bool enablePushNotifications,
    required final bool isVisuallyImpaired,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$PreferencesResponseImpl;
  const _PreferencesResponse._() : super._();

  factory _PreferencesResponse.fromJson(Map<String, dynamic> json) =
      _$PreferencesResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get narrativeStyle;
  @override
  String get preferredLength;
  @override
  double get ttsSpeed;
  @override
  double get ttsPitch;
  @override
  String get ttsVoice;
  @override
  String get preferredLanguage;
  @override
  bool get enableHapticFeedback;
  @override
  bool get enableAudioDescriptions;
  @override
  bool get highContrastMode;
  @override
  bool get enablePushNotifications;
  @override
  bool get isVisuallyImpaired;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesResponseImplCopyWith<_$PreferencesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreferencesApiResponse _$PreferencesApiResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PreferencesApiResponse.fromJson(json);
}

/// @nodoc
mixin _$PreferencesApiResponse {
  bool get success => throw _privateConstructorUsedError;
  PreferencesResponse get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this PreferencesApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesApiResponseCopyWith<PreferencesApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesApiResponseCopyWith<$Res> {
  factory $PreferencesApiResponseCopyWith(
    PreferencesApiResponse value,
    $Res Function(PreferencesApiResponse) then,
  ) = _$PreferencesApiResponseCopyWithImpl<$Res, PreferencesApiResponse>;
  @useResult
  $Res call({bool success, PreferencesResponse data, String? message});

  $PreferencesResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$PreferencesApiResponseCopyWithImpl<
  $Res,
  $Val extends PreferencesApiResponse
>
    implements $PreferencesApiResponseCopyWith<$Res> {
  _$PreferencesApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as PreferencesResponse,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferencesResponseCopyWith<$Res> get data {
    return $PreferencesResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreferencesApiResponseImplCopyWith<$Res>
    implements $PreferencesApiResponseCopyWith<$Res> {
  factory _$$PreferencesApiResponseImplCopyWith(
    _$PreferencesApiResponseImpl value,
    $Res Function(_$PreferencesApiResponseImpl) then,
  ) = __$$PreferencesApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, PreferencesResponse data, String? message});

  @override
  $PreferencesResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$PreferencesApiResponseImplCopyWithImpl<$Res>
    extends
        _$PreferencesApiResponseCopyWithImpl<$Res, _$PreferencesApiResponseImpl>
    implements _$$PreferencesApiResponseImplCopyWith<$Res> {
  __$$PreferencesApiResponseImplCopyWithImpl(
    _$PreferencesApiResponseImpl _value,
    $Res Function(_$PreferencesApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(
      _$PreferencesApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as PreferencesResponse,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesApiResponseImpl extends _PreferencesApiResponse {
  const _$PreferencesApiResponseImpl({
    required this.success,
    required this.data,
    this.message,
  }) : super._();

  factory _$PreferencesApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final PreferencesResponse data;
  @override
  final String? message;

  @override
  String toString() {
    return 'PreferencesApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesApiResponseImplCopyWith<_$PreferencesApiResponseImpl>
  get copyWith =>
      __$$PreferencesApiResponseImplCopyWithImpl<_$PreferencesApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesApiResponseImplToJson(this);
  }
}

abstract class _PreferencesApiResponse extends PreferencesApiResponse {
  const factory _PreferencesApiResponse({
    required final bool success,
    required final PreferencesResponse data,
    final String? message,
  }) = _$PreferencesApiResponseImpl;
  const _PreferencesApiResponse._() : super._();

  factory _PreferencesApiResponse.fromJson(Map<String, dynamic> json) =
      _$PreferencesApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  PreferencesResponse get data;
  @override
  String? get message;

  /// Create a copy of PreferencesApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesApiResponseImplCopyWith<_$PreferencesApiResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
