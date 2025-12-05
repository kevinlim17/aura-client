// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  List<String> get interests => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;
  List<String> get favoriteArtists => throw _privateConstructorUsedError;
  String? get additionalInfo => throw _privateConstructorUsedError;

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
    ProfileData value,
    $Res Function(ProfileData) then,
  ) = _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call({
    List<String> interests,
    List<String> hobbies,
    List<String> favoriteArtists,
    String? additionalInfo,
  });
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? hobbies = null,
    Object? favoriteArtists = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            interests: null == interests
                ? _value.interests
                : interests // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hobbies: null == hobbies
                ? _value.hobbies
                : hobbies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            favoriteArtists: null == favoriteArtists
                ? _value.favoriteArtists
                : favoriteArtists // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            additionalInfo: freezed == additionalInfo
                ? _value.additionalInfo
                : additionalInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
    _$ProfileDataImpl value,
    $Res Function(_$ProfileDataImpl) then,
  ) = __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> interests,
    List<String> hobbies,
    List<String> favoriteArtists,
    String? additionalInfo,
  });
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
    _$ProfileDataImpl _value,
    $Res Function(_$ProfileDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? hobbies = null,
    Object? favoriteArtists = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(
      _$ProfileDataImpl(
        interests: null == interests
            ? _value._interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hobbies: null == hobbies
            ? _value._hobbies
            : hobbies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        favoriteArtists: null == favoriteArtists
            ? _value._favoriteArtists
            : favoriteArtists // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        additionalInfo: freezed == additionalInfo
            ? _value.additionalInfo
            : additionalInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl({
    final List<String> interests = const [],
    final List<String> hobbies = const [],
    final List<String> favoriteArtists = const [],
    this.additionalInfo,
  }) : _interests = interests,
       _hobbies = hobbies,
       _favoriteArtists = favoriteArtists;

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  final List<String> _interests;
  @override
  @JsonKey()
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  final List<String> _hobbies;
  @override
  @JsonKey()
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  final List<String> _favoriteArtists;
  @override
  @JsonKey()
  List<String> get favoriteArtists {
    if (_favoriteArtists is EqualUnmodifiableListView) return _favoriteArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteArtists);
  }

  @override
  final String? additionalInfo;

  @override
  String toString() {
    return 'ProfileData(interests: $interests, hobbies: $hobbies, favoriteArtists: $favoriteArtists, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            const DeepCollectionEquality().equals(
              other._interests,
              _interests,
            ) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies) &&
            const DeepCollectionEquality().equals(
              other._favoriteArtists,
              _favoriteArtists,
            ) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_interests),
    const DeepCollectionEquality().hash(_hobbies),
    const DeepCollectionEquality().hash(_favoriteArtists),
    additionalInfo,
  );

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(this);
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData({
    final List<String> interests,
    final List<String> hobbies,
    final List<String> favoriteArtists,
    final String? additionalInfo,
  }) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  List<String> get interests;
  @override
  List<String> get hobbies;
  @override
  List<String> get favoriteArtists;
  @override
  String? get additionalInfo;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContextData _$ContextDataFromJson(Map<String, dynamic> json) {
  return _ContextData.fromJson(json);
}

/// @nodoc
mixin _$ContextData {
  String? get artMemory => throw _privateConstructorUsedError;
  String? get emotionalConnection => throw _privateConstructorUsedError;
  String? get visitGoal => throw _privateConstructorUsedError;
  String? get additionalContext => throw _privateConstructorUsedError;

  /// Serializes this ContextData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContextData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContextDataCopyWith<ContextData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextDataCopyWith<$Res> {
  factory $ContextDataCopyWith(
    ContextData value,
    $Res Function(ContextData) then,
  ) = _$ContextDataCopyWithImpl<$Res, ContextData>;
  @useResult
  $Res call({
    String? artMemory,
    String? emotionalConnection,
    String? visitGoal,
    String? additionalContext,
  });
}

/// @nodoc
class _$ContextDataCopyWithImpl<$Res, $Val extends ContextData>
    implements $ContextDataCopyWith<$Res> {
  _$ContextDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artMemory = freezed,
    Object? emotionalConnection = freezed,
    Object? visitGoal = freezed,
    Object? additionalContext = freezed,
  }) {
    return _then(
      _value.copyWith(
            artMemory: freezed == artMemory
                ? _value.artMemory
                : artMemory // ignore: cast_nullable_to_non_nullable
                      as String?,
            emotionalConnection: freezed == emotionalConnection
                ? _value.emotionalConnection
                : emotionalConnection // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitGoal: freezed == visitGoal
                ? _value.visitGoal
                : visitGoal // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalContext: freezed == additionalContext
                ? _value.additionalContext
                : additionalContext // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContextDataImplCopyWith<$Res>
    implements $ContextDataCopyWith<$Res> {
  factory _$$ContextDataImplCopyWith(
    _$ContextDataImpl value,
    $Res Function(_$ContextDataImpl) then,
  ) = __$$ContextDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? artMemory,
    String? emotionalConnection,
    String? visitGoal,
    String? additionalContext,
  });
}

/// @nodoc
class __$$ContextDataImplCopyWithImpl<$Res>
    extends _$ContextDataCopyWithImpl<$Res, _$ContextDataImpl>
    implements _$$ContextDataImplCopyWith<$Res> {
  __$$ContextDataImplCopyWithImpl(
    _$ContextDataImpl _value,
    $Res Function(_$ContextDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artMemory = freezed,
    Object? emotionalConnection = freezed,
    Object? visitGoal = freezed,
    Object? additionalContext = freezed,
  }) {
    return _then(
      _$ContextDataImpl(
        artMemory: freezed == artMemory
            ? _value.artMemory
            : artMemory // ignore: cast_nullable_to_non_nullable
                  as String?,
        emotionalConnection: freezed == emotionalConnection
            ? _value.emotionalConnection
            : emotionalConnection // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitGoal: freezed == visitGoal
            ? _value.visitGoal
            : visitGoal // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalContext: freezed == additionalContext
            ? _value.additionalContext
            : additionalContext // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextDataImpl implements _ContextData {
  const _$ContextDataImpl({
    this.artMemory,
    this.emotionalConnection,
    this.visitGoal,
    this.additionalContext,
  });

  factory _$ContextDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextDataImplFromJson(json);

  @override
  final String? artMemory;
  @override
  final String? emotionalConnection;
  @override
  final String? visitGoal;
  @override
  final String? additionalContext;

  @override
  String toString() {
    return 'ContextData(artMemory: $artMemory, emotionalConnection: $emotionalConnection, visitGoal: $visitGoal, additionalContext: $additionalContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextDataImpl &&
            (identical(other.artMemory, artMemory) ||
                other.artMemory == artMemory) &&
            (identical(other.emotionalConnection, emotionalConnection) ||
                other.emotionalConnection == emotionalConnection) &&
            (identical(other.visitGoal, visitGoal) ||
                other.visitGoal == visitGoal) &&
            (identical(other.additionalContext, additionalContext) ||
                other.additionalContext == additionalContext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    artMemory,
    emotionalConnection,
    visitGoal,
    additionalContext,
  );

  /// Create a copy of ContextData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextDataImplCopyWith<_$ContextDataImpl> get copyWith =>
      __$$ContextDataImplCopyWithImpl<_$ContextDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextDataImplToJson(this);
  }
}

abstract class _ContextData implements ContextData {
  const factory _ContextData({
    final String? artMemory,
    final String? emotionalConnection,
    final String? visitGoal,
    final String? additionalContext,
  }) = _$ContextDataImpl;

  factory _ContextData.fromJson(Map<String, dynamic> json) =
      _$ContextDataImpl.fromJson;

  @override
  String? get artMemory;
  @override
  String? get emotionalConnection;
  @override
  String? get visitGoal;
  @override
  String? get additionalContext;

  /// Create a copy of ContextData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextDataImplCopyWith<_$ContextDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreferencesData _$PreferencesDataFromJson(Map<String, dynamic> json) {
  return _PreferencesData.fromJson(json);
}

/// @nodoc
mixin _$PreferencesData {
  NarrativeStyle get narrativeStyle => throw _privateConstructorUsedError;
  TtsSpeed get ttsSpeed => throw _privateConstructorUsedError;
  bool get enableHapticFeedback => throw _privateConstructorUsedError;
  bool get enableAutoPlay => throw _privateConstructorUsedError;
  String get preferredLanguage => throw _privateConstructorUsedError;

  /// Serializes this PreferencesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferencesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesDataCopyWith<PreferencesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesDataCopyWith<$Res> {
  factory $PreferencesDataCopyWith(
    PreferencesData value,
    $Res Function(PreferencesData) then,
  ) = _$PreferencesDataCopyWithImpl<$Res, PreferencesData>;
  @useResult
  $Res call({
    NarrativeStyle narrativeStyle,
    TtsSpeed ttsSpeed,
    bool enableHapticFeedback,
    bool enableAutoPlay,
    String preferredLanguage,
  });
}

/// @nodoc
class _$PreferencesDataCopyWithImpl<$Res, $Val extends PreferencesData>
    implements $PreferencesDataCopyWith<$Res> {
  _$PreferencesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferencesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? narrativeStyle = null,
    Object? ttsSpeed = null,
    Object? enableHapticFeedback = null,
    Object? enableAutoPlay = null,
    Object? preferredLanguage = null,
  }) {
    return _then(
      _value.copyWith(
            narrativeStyle: null == narrativeStyle
                ? _value.narrativeStyle
                : narrativeStyle // ignore: cast_nullable_to_non_nullable
                      as NarrativeStyle,
            ttsSpeed: null == ttsSpeed
                ? _value.ttsSpeed
                : ttsSpeed // ignore: cast_nullable_to_non_nullable
                      as TtsSpeed,
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableAutoPlay: null == enableAutoPlay
                ? _value.enableAutoPlay
                : enableAutoPlay // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferredLanguage: null == preferredLanguage
                ? _value.preferredLanguage
                : preferredLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreferencesDataImplCopyWith<$Res>
    implements $PreferencesDataCopyWith<$Res> {
  factory _$$PreferencesDataImplCopyWith(
    _$PreferencesDataImpl value,
    $Res Function(_$PreferencesDataImpl) then,
  ) = __$$PreferencesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    NarrativeStyle narrativeStyle,
    TtsSpeed ttsSpeed,
    bool enableHapticFeedback,
    bool enableAutoPlay,
    String preferredLanguage,
  });
}

/// @nodoc
class __$$PreferencesDataImplCopyWithImpl<$Res>
    extends _$PreferencesDataCopyWithImpl<$Res, _$PreferencesDataImpl>
    implements _$$PreferencesDataImplCopyWith<$Res> {
  __$$PreferencesDataImplCopyWithImpl(
    _$PreferencesDataImpl _value,
    $Res Function(_$PreferencesDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreferencesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? narrativeStyle = null,
    Object? ttsSpeed = null,
    Object? enableHapticFeedback = null,
    Object? enableAutoPlay = null,
    Object? preferredLanguage = null,
  }) {
    return _then(
      _$PreferencesDataImpl(
        narrativeStyle: null == narrativeStyle
            ? _value.narrativeStyle
            : narrativeStyle // ignore: cast_nullable_to_non_nullable
                  as NarrativeStyle,
        ttsSpeed: null == ttsSpeed
            ? _value.ttsSpeed
            : ttsSpeed // ignore: cast_nullable_to_non_nullable
                  as TtsSpeed,
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableAutoPlay: null == enableAutoPlay
            ? _value.enableAutoPlay
            : enableAutoPlay // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferredLanguage: null == preferredLanguage
            ? _value.preferredLanguage
            : preferredLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesDataImpl implements _PreferencesData {
  const _$PreferencesDataImpl({
    this.narrativeStyle = NarrativeStyle.descriptive,
    this.ttsSpeed = TtsSpeed.normal,
    this.enableHapticFeedback = true,
    this.enableAutoPlay = true,
    this.preferredLanguage = 'ko-KR',
  });

  factory _$PreferencesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesDataImplFromJson(json);

  @override
  @JsonKey()
  final NarrativeStyle narrativeStyle;
  @override
  @JsonKey()
  final TtsSpeed ttsSpeed;
  @override
  @JsonKey()
  final bool enableHapticFeedback;
  @override
  @JsonKey()
  final bool enableAutoPlay;
  @override
  @JsonKey()
  final String preferredLanguage;

  @override
  String toString() {
    return 'PreferencesData(narrativeStyle: $narrativeStyle, ttsSpeed: $ttsSpeed, enableHapticFeedback: $enableHapticFeedback, enableAutoPlay: $enableAutoPlay, preferredLanguage: $preferredLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesDataImpl &&
            (identical(other.narrativeStyle, narrativeStyle) ||
                other.narrativeStyle == narrativeStyle) &&
            (identical(other.ttsSpeed, ttsSpeed) ||
                other.ttsSpeed == ttsSpeed) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.enableAutoPlay, enableAutoPlay) ||
                other.enableAutoPlay == enableAutoPlay) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    narrativeStyle,
    ttsSpeed,
    enableHapticFeedback,
    enableAutoPlay,
    preferredLanguage,
  );

  /// Create a copy of PreferencesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesDataImplCopyWith<_$PreferencesDataImpl> get copyWith =>
      __$$PreferencesDataImplCopyWithImpl<_$PreferencesDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesDataImplToJson(this);
  }
}

abstract class _PreferencesData implements PreferencesData {
  const factory _PreferencesData({
    final NarrativeStyle narrativeStyle,
    final TtsSpeed ttsSpeed,
    final bool enableHapticFeedback,
    final bool enableAutoPlay,
    final String preferredLanguage,
  }) = _$PreferencesDataImpl;

  factory _PreferencesData.fromJson(Map<String, dynamic> json) =
      _$PreferencesDataImpl.fromJson;

  @override
  NarrativeStyle get narrativeStyle;
  @override
  TtsSpeed get ttsSpeed;
  @override
  bool get enableHapticFeedback;
  @override
  bool get enableAutoPlay;
  @override
  String get preferredLanguage;

  /// Create a copy of PreferencesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesDataImplCopyWith<_$PreferencesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) {
  return _OnboardingData.fromJson(json);
}

/// @nodoc
mixin _$OnboardingData {
  ProfileData get profile => throw _privateConstructorUsedError;
  ContextData get context => throw _privateConstructorUsedError;
  PreferencesData get preferences => throw _privateConstructorUsedError;
  OnboardingStep get currentStep => throw _privateConstructorUsedError;
  Map<OnboardingStep, bool> get completedSteps =>
      throw _privateConstructorUsedError;
  Map<OnboardingStep, bool> get skippedSteps =>
      throw _privateConstructorUsedError;

  /// Serializes this OnboardingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingDataCopyWith<OnboardingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingDataCopyWith<$Res> {
  factory $OnboardingDataCopyWith(
    OnboardingData value,
    $Res Function(OnboardingData) then,
  ) = _$OnboardingDataCopyWithImpl<$Res, OnboardingData>;
  @useResult
  $Res call({
    ProfileData profile,
    ContextData context,
    PreferencesData preferences,
    OnboardingStep currentStep,
    Map<OnboardingStep, bool> completedSteps,
    Map<OnboardingStep, bool> skippedSteps,
  });

  $ProfileDataCopyWith<$Res> get profile;
  $ContextDataCopyWith<$Res> get context;
  $PreferencesDataCopyWith<$Res> get preferences;
}

/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res, $Val extends OnboardingData>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? context = null,
    Object? preferences = null,
    Object? currentStep = null,
    Object? completedSteps = null,
    Object? skippedSteps = null,
  }) {
    return _then(
      _value.copyWith(
            profile: null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as ProfileData,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as ContextData,
            preferences: null == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                      as PreferencesData,
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as OnboardingStep,
            completedSteps: null == completedSteps
                ? _value.completedSteps
                : completedSteps // ignore: cast_nullable_to_non_nullable
                      as Map<OnboardingStep, bool>,
            skippedSteps: null == skippedSteps
                ? _value.skippedSteps
                : skippedSteps // ignore: cast_nullable_to_non_nullable
                      as Map<OnboardingStep, bool>,
          )
          as $Val,
    );
  }

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res> get profile {
    return $ProfileDataCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextDataCopyWith<$Res> get context {
    return $ContextDataCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferencesDataCopyWith<$Res> get preferences {
    return $PreferencesDataCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingDataImplCopyWith<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  factory _$$OnboardingDataImplCopyWith(
    _$OnboardingDataImpl value,
    $Res Function(_$OnboardingDataImpl) then,
  ) = __$$OnboardingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProfileData profile,
    ContextData context,
    PreferencesData preferences,
    OnboardingStep currentStep,
    Map<OnboardingStep, bool> completedSteps,
    Map<OnboardingStep, bool> skippedSteps,
  });

  @override
  $ProfileDataCopyWith<$Res> get profile;
  @override
  $ContextDataCopyWith<$Res> get context;
  @override
  $PreferencesDataCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$OnboardingDataImplCopyWithImpl<$Res>
    extends _$OnboardingDataCopyWithImpl<$Res, _$OnboardingDataImpl>
    implements _$$OnboardingDataImplCopyWith<$Res> {
  __$$OnboardingDataImplCopyWithImpl(
    _$OnboardingDataImpl _value,
    $Res Function(_$OnboardingDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? context = null,
    Object? preferences = null,
    Object? currentStep = null,
    Object? completedSteps = null,
    Object? skippedSteps = null,
  }) {
    return _then(
      _$OnboardingDataImpl(
        profile: null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as ProfileData,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as ContextData,
        preferences: null == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as PreferencesData,
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as OnboardingStep,
        completedSteps: null == completedSteps
            ? _value._completedSteps
            : completedSteps // ignore: cast_nullable_to_non_nullable
                  as Map<OnboardingStep, bool>,
        skippedSteps: null == skippedSteps
            ? _value._skippedSteps
            : skippedSteps // ignore: cast_nullable_to_non_nullable
                  as Map<OnboardingStep, bool>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingDataImpl implements _OnboardingData {
  const _$OnboardingDataImpl({
    this.profile = const ProfileData(),
    this.context = const ContextData(),
    this.preferences = const PreferencesData(),
    this.currentStep = OnboardingStep.profile,
    final Map<OnboardingStep, bool> completedSteps = const {},
    final Map<OnboardingStep, bool> skippedSteps = const {},
  }) : _completedSteps = completedSteps,
       _skippedSteps = skippedSteps;

  factory _$OnboardingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingDataImplFromJson(json);

  @override
  @JsonKey()
  final ProfileData profile;
  @override
  @JsonKey()
  final ContextData context;
  @override
  @JsonKey()
  final PreferencesData preferences;
  @override
  @JsonKey()
  final OnboardingStep currentStep;
  final Map<OnboardingStep, bool> _completedSteps;
  @override
  @JsonKey()
  Map<OnboardingStep, bool> get completedSteps {
    if (_completedSteps is EqualUnmodifiableMapView) return _completedSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_completedSteps);
  }

  final Map<OnboardingStep, bool> _skippedSteps;
  @override
  @JsonKey()
  Map<OnboardingStep, bool> get skippedSteps {
    if (_skippedSteps is EqualUnmodifiableMapView) return _skippedSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_skippedSteps);
  }

  @override
  String toString() {
    return 'OnboardingData(profile: $profile, context: $context, preferences: $preferences, currentStep: $currentStep, completedSteps: $completedSteps, skippedSteps: $skippedSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingDataImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality().equals(
              other._completedSteps,
              _completedSteps,
            ) &&
            const DeepCollectionEquality().equals(
              other._skippedSteps,
              _skippedSteps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    profile,
    context,
    preferences,
    currentStep,
    const DeepCollectionEquality().hash(_completedSteps),
    const DeepCollectionEquality().hash(_skippedSteps),
  );

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      __$$OnboardingDataImplCopyWithImpl<_$OnboardingDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingDataImplToJson(this);
  }
}

abstract class _OnboardingData implements OnboardingData {
  const factory _OnboardingData({
    final ProfileData profile,
    final ContextData context,
    final PreferencesData preferences,
    final OnboardingStep currentStep,
    final Map<OnboardingStep, bool> completedSteps,
    final Map<OnboardingStep, bool> skippedSteps,
  }) = _$OnboardingDataImpl;

  factory _OnboardingData.fromJson(Map<String, dynamic> json) =
      _$OnboardingDataImpl.fromJson;

  @override
  ProfileData get profile;
  @override
  ContextData get context;
  @override
  PreferencesData get preferences;
  @override
  OnboardingStep get currentStep;
  @override
  Map<OnboardingStep, bool> get completedSteps;
  @override
  Map<OnboardingStep, bool> get skippedSteps;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
