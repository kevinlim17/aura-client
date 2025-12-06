// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docent_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FewShotExample _$FewShotExampleFromJson(Map<String, dynamic> json) {
  return _FewShotExample.fromJson(json);
}

/// @nodoc
mixin _$FewShotExample {
  String get userContextSummary => throw _privateConstructorUsedError;
  String get exemplarText => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;

  /// Serializes this FewShotExample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FewShotExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FewShotExampleCopyWith<FewShotExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FewShotExampleCopyWith<$Res> {
  factory $FewShotExampleCopyWith(
    FewShotExample value,
    $Res Function(FewShotExample) then,
  ) = _$FewShotExampleCopyWithImpl<$Res, FewShotExample>;
  @useResult
  $Res call({
    String userContextSummary,
    String exemplarText,
    double qualityScore,
  });
}

/// @nodoc
class _$FewShotExampleCopyWithImpl<$Res, $Val extends FewShotExample>
    implements $FewShotExampleCopyWith<$Res> {
  _$FewShotExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FewShotExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userContextSummary = null,
    Object? exemplarText = null,
    Object? qualityScore = null,
  }) {
    return _then(
      _value.copyWith(
            userContextSummary: null == userContextSummary
                ? _value.userContextSummary
                : userContextSummary // ignore: cast_nullable_to_non_nullable
                      as String,
            exemplarText: null == exemplarText
                ? _value.exemplarText
                : exemplarText // ignore: cast_nullable_to_non_nullable
                      as String,
            qualityScore: null == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FewShotExampleImplCopyWith<$Res>
    implements $FewShotExampleCopyWith<$Res> {
  factory _$$FewShotExampleImplCopyWith(
    _$FewShotExampleImpl value,
    $Res Function(_$FewShotExampleImpl) then,
  ) = __$$FewShotExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userContextSummary,
    String exemplarText,
    double qualityScore,
  });
}

/// @nodoc
class __$$FewShotExampleImplCopyWithImpl<$Res>
    extends _$FewShotExampleCopyWithImpl<$Res, _$FewShotExampleImpl>
    implements _$$FewShotExampleImplCopyWith<$Res> {
  __$$FewShotExampleImplCopyWithImpl(
    _$FewShotExampleImpl _value,
    $Res Function(_$FewShotExampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FewShotExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userContextSummary = null,
    Object? exemplarText = null,
    Object? qualityScore = null,
  }) {
    return _then(
      _$FewShotExampleImpl(
        userContextSummary: null == userContextSummary
            ? _value.userContextSummary
            : userContextSummary // ignore: cast_nullable_to_non_nullable
                  as String,
        exemplarText: null == exemplarText
            ? _value.exemplarText
            : exemplarText // ignore: cast_nullable_to_non_nullable
                  as String,
        qualityScore: null == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FewShotExampleImpl implements _FewShotExample {
  const _$FewShotExampleImpl({
    required this.userContextSummary,
    required this.exemplarText,
    required this.qualityScore,
  });

  factory _$FewShotExampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FewShotExampleImplFromJson(json);

  @override
  final String userContextSummary;
  @override
  final String exemplarText;
  @override
  final double qualityScore;

  @override
  String toString() {
    return 'FewShotExample(userContextSummary: $userContextSummary, exemplarText: $exemplarText, qualityScore: $qualityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FewShotExampleImpl &&
            (identical(other.userContextSummary, userContextSummary) ||
                other.userContextSummary == userContextSummary) &&
            (identical(other.exemplarText, exemplarText) ||
                other.exemplarText == exemplarText) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userContextSummary, exemplarText, qualityScore);

  /// Create a copy of FewShotExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FewShotExampleImplCopyWith<_$FewShotExampleImpl> get copyWith =>
      __$$FewShotExampleImplCopyWithImpl<_$FewShotExampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FewShotExampleImplToJson(this);
  }
}

abstract class _FewShotExample implements FewShotExample {
  const factory _FewShotExample({
    required final String userContextSummary,
    required final String exemplarText,
    required final double qualityScore,
  }) = _$FewShotExampleImpl;

  factory _FewShotExample.fromJson(Map<String, dynamic> json) =
      _$FewShotExampleImpl.fromJson;

  @override
  String get userContextSummary;
  @override
  String get exemplarText;
  @override
  double get qualityScore;

  /// Create a copy of FewShotExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FewShotExampleImplCopyWith<_$FewShotExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocentSessionEntity _$DocentSessionEntityFromJson(Map<String, dynamic> json) {
  return _DocentSessionEntity.fromJson(json);
}

/// @nodoc
mixin _$DocentSessionEntity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get artworkId => throw _privateConstructorUsedError;
  String? get artworkTitle => throw _privateConstructorUsedError;
  String? get artworkArtist => throw _privateConstructorUsedError;
  String? get artworkImageUrl =>
      throw _privateConstructorUsedError; // Prompt information
  String get promptTemplate => throw _privateConstructorUsedError;
  String? get promptPersona => throw _privateConstructorUsedError;
  String? get promptTask => throw _privateConstructorUsedError;
  String? get promptContext => throw _privateConstructorUsedError;
  String? get promptForm => throw _privateConstructorUsedError;
  List<FewShotExample> get fewShotExamples =>
      throw _privateConstructorUsedError; // Generated content
  String get generatedText =>
      throw _privateConstructorUsedError; // Gemini API metadata
  String? get geminiModel => throw _privateConstructorUsedError;
  double? get geminiTemperature => throw _privateConstructorUsedError;
  double? get geminiTopP => throw _privateConstructorUsedError;
  int? get geminiTopK => throw _privateConstructorUsedError;
  int? get generationTimeMs => throw _privateConstructorUsedError; // TTS audio
  String? get ttsAudioUrl => throw _privateConstructorUsedError;
  int? get ttsDurationSeconds =>
      throw _privateConstructorUsedError; // Playback statistics
  int get playCount => throw _privateConstructorUsedError;
  int get totalListeningSeconds => throw _privateConstructorUsedError;
  double? get completionRate => throw _privateConstructorUsedError; // Status
  DocentStatus get status => throw _privateConstructorUsedError; // Timestamps
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastPlayedAt => throw _privateConstructorUsedError;

  /// Serializes this DocentSessionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentSessionEntityCopyWith<DocentSessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentSessionEntityCopyWith<$Res> {
  factory $DocentSessionEntityCopyWith(
    DocentSessionEntity value,
    $Res Function(DocentSessionEntity) then,
  ) = _$DocentSessionEntityCopyWithImpl<$Res, DocentSessionEntity>;
  @useResult
  $Res call({
    int id,
    int userId,
    int artworkId,
    String? artworkTitle,
    String? artworkArtist,
    String? artworkImageUrl,
    String promptTemplate,
    String? promptPersona,
    String? promptTask,
    String? promptContext,
    String? promptForm,
    List<FewShotExample> fewShotExamples,
    String generatedText,
    String? geminiModel,
    double? geminiTemperature,
    double? geminiTopP,
    int? geminiTopK,
    int? generationTimeMs,
    String? ttsAudioUrl,
    int? ttsDurationSeconds,
    int playCount,
    int totalListeningSeconds,
    double? completionRate,
    DocentStatus status,
    DateTime createdAt,
    DateTime? lastPlayedAt,
  });
}

/// @nodoc
class _$DocentSessionEntityCopyWithImpl<$Res, $Val extends DocentSessionEntity>
    implements $DocentSessionEntityCopyWith<$Res> {
  _$DocentSessionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? artworkId = null,
    Object? artworkTitle = freezed,
    Object? artworkArtist = freezed,
    Object? artworkImageUrl = freezed,
    Object? promptTemplate = null,
    Object? promptPersona = freezed,
    Object? promptTask = freezed,
    Object? promptContext = freezed,
    Object? promptForm = freezed,
    Object? fewShotExamples = null,
    Object? generatedText = null,
    Object? geminiModel = freezed,
    Object? geminiTemperature = freezed,
    Object? geminiTopP = freezed,
    Object? geminiTopK = freezed,
    Object? generationTimeMs = freezed,
    Object? ttsAudioUrl = freezed,
    Object? ttsDurationSeconds = freezed,
    Object? playCount = null,
    Object? totalListeningSeconds = null,
    Object? completionRate = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? lastPlayedAt = freezed,
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
            artworkId: null == artworkId
                ? _value.artworkId
                : artworkId // ignore: cast_nullable_to_non_nullable
                      as int,
            artworkTitle: freezed == artworkTitle
                ? _value.artworkTitle
                : artworkTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            artworkArtist: freezed == artworkArtist
                ? _value.artworkArtist
                : artworkArtist // ignore: cast_nullable_to_non_nullable
                      as String?,
            artworkImageUrl: freezed == artworkImageUrl
                ? _value.artworkImageUrl
                : artworkImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptTemplate: null == promptTemplate
                ? _value.promptTemplate
                : promptTemplate // ignore: cast_nullable_to_non_nullable
                      as String,
            promptPersona: freezed == promptPersona
                ? _value.promptPersona
                : promptPersona // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptTask: freezed == promptTask
                ? _value.promptTask
                : promptTask // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptContext: freezed == promptContext
                ? _value.promptContext
                : promptContext // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptForm: freezed == promptForm
                ? _value.promptForm
                : promptForm // ignore: cast_nullable_to_non_nullable
                      as String?,
            fewShotExamples: null == fewShotExamples
                ? _value.fewShotExamples
                : fewShotExamples // ignore: cast_nullable_to_non_nullable
                      as List<FewShotExample>,
            generatedText: null == generatedText
                ? _value.generatedText
                : generatedText // ignore: cast_nullable_to_non_nullable
                      as String,
            geminiModel: freezed == geminiModel
                ? _value.geminiModel
                : geminiModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            geminiTemperature: freezed == geminiTemperature
                ? _value.geminiTemperature
                : geminiTemperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            geminiTopP: freezed == geminiTopP
                ? _value.geminiTopP
                : geminiTopP // ignore: cast_nullable_to_non_nullable
                      as double?,
            geminiTopK: freezed == geminiTopK
                ? _value.geminiTopK
                : geminiTopK // ignore: cast_nullable_to_non_nullable
                      as int?,
            generationTimeMs: freezed == generationTimeMs
                ? _value.generationTimeMs
                : generationTimeMs // ignore: cast_nullable_to_non_nullable
                      as int?,
            ttsAudioUrl: freezed == ttsAudioUrl
                ? _value.ttsAudioUrl
                : ttsAudioUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            ttsDurationSeconds: freezed == ttsDurationSeconds
                ? _value.ttsDurationSeconds
                : ttsDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            playCount: null == playCount
                ? _value.playCount
                : playCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalListeningSeconds: null == totalListeningSeconds
                ? _value.totalListeningSeconds
                : totalListeningSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: freezed == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DocentStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastPlayedAt: freezed == lastPlayedAt
                ? _value.lastPlayedAt
                : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocentSessionEntityImplCopyWith<$Res>
    implements $DocentSessionEntityCopyWith<$Res> {
  factory _$$DocentSessionEntityImplCopyWith(
    _$DocentSessionEntityImpl value,
    $Res Function(_$DocentSessionEntityImpl) then,
  ) = __$$DocentSessionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    int artworkId,
    String? artworkTitle,
    String? artworkArtist,
    String? artworkImageUrl,
    String promptTemplate,
    String? promptPersona,
    String? promptTask,
    String? promptContext,
    String? promptForm,
    List<FewShotExample> fewShotExamples,
    String generatedText,
    String? geminiModel,
    double? geminiTemperature,
    double? geminiTopP,
    int? geminiTopK,
    int? generationTimeMs,
    String? ttsAudioUrl,
    int? ttsDurationSeconds,
    int playCount,
    int totalListeningSeconds,
    double? completionRate,
    DocentStatus status,
    DateTime createdAt,
    DateTime? lastPlayedAt,
  });
}

/// @nodoc
class __$$DocentSessionEntityImplCopyWithImpl<$Res>
    extends _$DocentSessionEntityCopyWithImpl<$Res, _$DocentSessionEntityImpl>
    implements _$$DocentSessionEntityImplCopyWith<$Res> {
  __$$DocentSessionEntityImplCopyWithImpl(
    _$DocentSessionEntityImpl _value,
    $Res Function(_$DocentSessionEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? artworkId = null,
    Object? artworkTitle = freezed,
    Object? artworkArtist = freezed,
    Object? artworkImageUrl = freezed,
    Object? promptTemplate = null,
    Object? promptPersona = freezed,
    Object? promptTask = freezed,
    Object? promptContext = freezed,
    Object? promptForm = freezed,
    Object? fewShotExamples = null,
    Object? generatedText = null,
    Object? geminiModel = freezed,
    Object? geminiTemperature = freezed,
    Object? geminiTopP = freezed,
    Object? geminiTopK = freezed,
    Object? generationTimeMs = freezed,
    Object? ttsAudioUrl = freezed,
    Object? ttsDurationSeconds = freezed,
    Object? playCount = null,
    Object? totalListeningSeconds = null,
    Object? completionRate = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? lastPlayedAt = freezed,
  }) {
    return _then(
      _$DocentSessionEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        artworkId: null == artworkId
            ? _value.artworkId
            : artworkId // ignore: cast_nullable_to_non_nullable
                  as int,
        artworkTitle: freezed == artworkTitle
            ? _value.artworkTitle
            : artworkTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        artworkArtist: freezed == artworkArtist
            ? _value.artworkArtist
            : artworkArtist // ignore: cast_nullable_to_non_nullable
                  as String?,
        artworkImageUrl: freezed == artworkImageUrl
            ? _value.artworkImageUrl
            : artworkImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptTemplate: null == promptTemplate
            ? _value.promptTemplate
            : promptTemplate // ignore: cast_nullable_to_non_nullable
                  as String,
        promptPersona: freezed == promptPersona
            ? _value.promptPersona
            : promptPersona // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptTask: freezed == promptTask
            ? _value.promptTask
            : promptTask // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptContext: freezed == promptContext
            ? _value.promptContext
            : promptContext // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptForm: freezed == promptForm
            ? _value.promptForm
            : promptForm // ignore: cast_nullable_to_non_nullable
                  as String?,
        fewShotExamples: null == fewShotExamples
            ? _value._fewShotExamples
            : fewShotExamples // ignore: cast_nullable_to_non_nullable
                  as List<FewShotExample>,
        generatedText: null == generatedText
            ? _value.generatedText
            : generatedText // ignore: cast_nullable_to_non_nullable
                  as String,
        geminiModel: freezed == geminiModel
            ? _value.geminiModel
            : geminiModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        geminiTemperature: freezed == geminiTemperature
            ? _value.geminiTemperature
            : geminiTemperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        geminiTopP: freezed == geminiTopP
            ? _value.geminiTopP
            : geminiTopP // ignore: cast_nullable_to_non_nullable
                  as double?,
        geminiTopK: freezed == geminiTopK
            ? _value.geminiTopK
            : geminiTopK // ignore: cast_nullable_to_non_nullable
                  as int?,
        generationTimeMs: freezed == generationTimeMs
            ? _value.generationTimeMs
            : generationTimeMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        ttsAudioUrl: freezed == ttsAudioUrl
            ? _value.ttsAudioUrl
            : ttsAudioUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        ttsDurationSeconds: freezed == ttsDurationSeconds
            ? _value.ttsDurationSeconds
            : ttsDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        playCount: null == playCount
            ? _value.playCount
            : playCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalListeningSeconds: null == totalListeningSeconds
            ? _value.totalListeningSeconds
            : totalListeningSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: freezed == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DocentStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastPlayedAt: freezed == lastPlayedAt
            ? _value.lastPlayedAt
            : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocentSessionEntityImpl extends _DocentSessionEntity {
  const _$DocentSessionEntityImpl({
    required this.id,
    required this.userId,
    required this.artworkId,
    this.artworkTitle,
    this.artworkArtist,
    this.artworkImageUrl,
    required this.promptTemplate,
    this.promptPersona,
    this.promptTask,
    this.promptContext,
    this.promptForm,
    final List<FewShotExample> fewShotExamples = const [],
    required this.generatedText,
    this.geminiModel,
    this.geminiTemperature,
    this.geminiTopP,
    this.geminiTopK,
    this.generationTimeMs,
    this.ttsAudioUrl,
    this.ttsDurationSeconds,
    this.playCount = 0,
    this.totalListeningSeconds = 0,
    this.completionRate,
    required this.status,
    required this.createdAt,
    this.lastPlayedAt,
  }) : _fewShotExamples = fewShotExamples,
       super._();

  factory _$DocentSessionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocentSessionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int artworkId;
  @override
  final String? artworkTitle;
  @override
  final String? artworkArtist;
  @override
  final String? artworkImageUrl;
  // Prompt information
  @override
  final String promptTemplate;
  @override
  final String? promptPersona;
  @override
  final String? promptTask;
  @override
  final String? promptContext;
  @override
  final String? promptForm;
  final List<FewShotExample> _fewShotExamples;
  @override
  @JsonKey()
  List<FewShotExample> get fewShotExamples {
    if (_fewShotExamples is EqualUnmodifiableListView) return _fewShotExamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fewShotExamples);
  }

  // Generated content
  @override
  final String generatedText;
  // Gemini API metadata
  @override
  final String? geminiModel;
  @override
  final double? geminiTemperature;
  @override
  final double? geminiTopP;
  @override
  final int? geminiTopK;
  @override
  final int? generationTimeMs;
  // TTS audio
  @override
  final String? ttsAudioUrl;
  @override
  final int? ttsDurationSeconds;
  // Playback statistics
  @override
  @JsonKey()
  final int playCount;
  @override
  @JsonKey()
  final int totalListeningSeconds;
  @override
  final double? completionRate;
  // Status
  @override
  final DocentStatus status;
  // Timestamps
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastPlayedAt;

  @override
  String toString() {
    return 'DocentSessionEntity(id: $id, userId: $userId, artworkId: $artworkId, artworkTitle: $artworkTitle, artworkArtist: $artworkArtist, artworkImageUrl: $artworkImageUrl, promptTemplate: $promptTemplate, promptPersona: $promptPersona, promptTask: $promptTask, promptContext: $promptContext, promptForm: $promptForm, fewShotExamples: $fewShotExamples, generatedText: $generatedText, geminiModel: $geminiModel, geminiTemperature: $geminiTemperature, geminiTopP: $geminiTopP, geminiTopK: $geminiTopK, generationTimeMs: $generationTimeMs, ttsAudioUrl: $ttsAudioUrl, ttsDurationSeconds: $ttsDurationSeconds, playCount: $playCount, totalListeningSeconds: $totalListeningSeconds, completionRate: $completionRate, status: $status, createdAt: $createdAt, lastPlayedAt: $lastPlayedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentSessionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.artworkTitle, artworkTitle) ||
                other.artworkTitle == artworkTitle) &&
            (identical(other.artworkArtist, artworkArtist) ||
                other.artworkArtist == artworkArtist) &&
            (identical(other.artworkImageUrl, artworkImageUrl) ||
                other.artworkImageUrl == artworkImageUrl) &&
            (identical(other.promptTemplate, promptTemplate) ||
                other.promptTemplate == promptTemplate) &&
            (identical(other.promptPersona, promptPersona) ||
                other.promptPersona == promptPersona) &&
            (identical(other.promptTask, promptTask) ||
                other.promptTask == promptTask) &&
            (identical(other.promptContext, promptContext) ||
                other.promptContext == promptContext) &&
            (identical(other.promptForm, promptForm) ||
                other.promptForm == promptForm) &&
            const DeepCollectionEquality().equals(
              other._fewShotExamples,
              _fewShotExamples,
            ) &&
            (identical(other.generatedText, generatedText) ||
                other.generatedText == generatedText) &&
            (identical(other.geminiModel, geminiModel) ||
                other.geminiModel == geminiModel) &&
            (identical(other.geminiTemperature, geminiTemperature) ||
                other.geminiTemperature == geminiTemperature) &&
            (identical(other.geminiTopP, geminiTopP) ||
                other.geminiTopP == geminiTopP) &&
            (identical(other.geminiTopK, geminiTopK) ||
                other.geminiTopK == geminiTopK) &&
            (identical(other.generationTimeMs, generationTimeMs) ||
                other.generationTimeMs == generationTimeMs) &&
            (identical(other.ttsAudioUrl, ttsAudioUrl) ||
                other.ttsAudioUrl == ttsAudioUrl) &&
            (identical(other.ttsDurationSeconds, ttsDurationSeconds) ||
                other.ttsDurationSeconds == ttsDurationSeconds) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.totalListeningSeconds, totalListeningSeconds) ||
                other.totalListeningSeconds == totalListeningSeconds) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastPlayedAt, lastPlayedAt) ||
                other.lastPlayedAt == lastPlayedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    artworkId,
    artworkTitle,
    artworkArtist,
    artworkImageUrl,
    promptTemplate,
    promptPersona,
    promptTask,
    promptContext,
    promptForm,
    const DeepCollectionEquality().hash(_fewShotExamples),
    generatedText,
    geminiModel,
    geminiTemperature,
    geminiTopP,
    geminiTopK,
    generationTimeMs,
    ttsAudioUrl,
    ttsDurationSeconds,
    playCount,
    totalListeningSeconds,
    completionRate,
    status,
    createdAt,
    lastPlayedAt,
  ]);

  /// Create a copy of DocentSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentSessionEntityImplCopyWith<_$DocentSessionEntityImpl> get copyWith =>
      __$$DocentSessionEntityImplCopyWithImpl<_$DocentSessionEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentSessionEntityImplToJson(this);
  }
}

abstract class _DocentSessionEntity extends DocentSessionEntity {
  const factory _DocentSessionEntity({
    required final int id,
    required final int userId,
    required final int artworkId,
    final String? artworkTitle,
    final String? artworkArtist,
    final String? artworkImageUrl,
    required final String promptTemplate,
    final String? promptPersona,
    final String? promptTask,
    final String? promptContext,
    final String? promptForm,
    final List<FewShotExample> fewShotExamples,
    required final String generatedText,
    final String? geminiModel,
    final double? geminiTemperature,
    final double? geminiTopP,
    final int? geminiTopK,
    final int? generationTimeMs,
    final String? ttsAudioUrl,
    final int? ttsDurationSeconds,
    final int playCount,
    final int totalListeningSeconds,
    final double? completionRate,
    required final DocentStatus status,
    required final DateTime createdAt,
    final DateTime? lastPlayedAt,
  }) = _$DocentSessionEntityImpl;
  const _DocentSessionEntity._() : super._();

  factory _DocentSessionEntity.fromJson(Map<String, dynamic> json) =
      _$DocentSessionEntityImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get artworkId;
  @override
  String? get artworkTitle;
  @override
  String? get artworkArtist;
  @override
  String? get artworkImageUrl; // Prompt information
  @override
  String get promptTemplate;
  @override
  String? get promptPersona;
  @override
  String? get promptTask;
  @override
  String? get promptContext;
  @override
  String? get promptForm;
  @override
  List<FewShotExample> get fewShotExamples; // Generated content
  @override
  String get generatedText; // Gemini API metadata
  @override
  String? get geminiModel;
  @override
  double? get geminiTemperature;
  @override
  double? get geminiTopP;
  @override
  int? get geminiTopK;
  @override
  int? get generationTimeMs; // TTS audio
  @override
  String? get ttsAudioUrl;
  @override
  int? get ttsDurationSeconds; // Playback statistics
  @override
  int get playCount;
  @override
  int get totalListeningSeconds;
  @override
  double? get completionRate; // Status
  @override
  DocentStatus get status; // Timestamps
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastPlayedAt;

  /// Create a copy of DocentSessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentSessionEntityImplCopyWith<_$DocentSessionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocentGenerationRequest _$DocentGenerationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _DocentGenerationRequest.fromJson(json);
}

/// @nodoc
mixin _$DocentGenerationRequest {
  int get userId => throw _privateConstructorUsedError;
  int get artworkId => throw _privateConstructorUsedError;
  NarrativeStyle? get narrativeStyle =>
      throw _privateConstructorUsedError; // optional, uses user preference if not provided
  PreferredLength? get preferredLength =>
      throw _privateConstructorUsedError; // optional, uses user preference if not provided
  bool get includeCompanionContext => throw _privateConstructorUsedError;
  bool get useFewShotExamples => throw _privateConstructorUsedError;
  String? get customPrompt => throw _privateConstructorUsedError;

  /// Serializes this DocentGenerationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentGenerationRequestCopyWith<DocentGenerationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentGenerationRequestCopyWith<$Res> {
  factory $DocentGenerationRequestCopyWith(
    DocentGenerationRequest value,
    $Res Function(DocentGenerationRequest) then,
  ) = _$DocentGenerationRequestCopyWithImpl<$Res, DocentGenerationRequest>;
  @useResult
  $Res call({
    int userId,
    int artworkId,
    NarrativeStyle? narrativeStyle,
    PreferredLength? preferredLength,
    bool includeCompanionContext,
    bool useFewShotExamples,
    String? customPrompt,
  });
}

/// @nodoc
class _$DocentGenerationRequestCopyWithImpl<
  $Res,
  $Val extends DocentGenerationRequest
>
    implements $DocentGenerationRequestCopyWith<$Res> {
  _$DocentGenerationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? artworkId = null,
    Object? narrativeStyle = freezed,
    Object? preferredLength = freezed,
    Object? includeCompanionContext = null,
    Object? useFewShotExamples = null,
    Object? customPrompt = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            artworkId: null == artworkId
                ? _value.artworkId
                : artworkId // ignore: cast_nullable_to_non_nullable
                      as int,
            narrativeStyle: freezed == narrativeStyle
                ? _value.narrativeStyle
                : narrativeStyle // ignore: cast_nullable_to_non_nullable
                      as NarrativeStyle?,
            preferredLength: freezed == preferredLength
                ? _value.preferredLength
                : preferredLength // ignore: cast_nullable_to_non_nullable
                      as PreferredLength?,
            includeCompanionContext: null == includeCompanionContext
                ? _value.includeCompanionContext
                : includeCompanionContext // ignore: cast_nullable_to_non_nullable
                      as bool,
            useFewShotExamples: null == useFewShotExamples
                ? _value.useFewShotExamples
                : useFewShotExamples // ignore: cast_nullable_to_non_nullable
                      as bool,
            customPrompt: freezed == customPrompt
                ? _value.customPrompt
                : customPrompt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocentGenerationRequestImplCopyWith<$Res>
    implements $DocentGenerationRequestCopyWith<$Res> {
  factory _$$DocentGenerationRequestImplCopyWith(
    _$DocentGenerationRequestImpl value,
    $Res Function(_$DocentGenerationRequestImpl) then,
  ) = __$$DocentGenerationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int userId,
    int artworkId,
    NarrativeStyle? narrativeStyle,
    PreferredLength? preferredLength,
    bool includeCompanionContext,
    bool useFewShotExamples,
    String? customPrompt,
  });
}

/// @nodoc
class __$$DocentGenerationRequestImplCopyWithImpl<$Res>
    extends
        _$DocentGenerationRequestCopyWithImpl<
          $Res,
          _$DocentGenerationRequestImpl
        >
    implements _$$DocentGenerationRequestImplCopyWith<$Res> {
  __$$DocentGenerationRequestImplCopyWithImpl(
    _$DocentGenerationRequestImpl _value,
    $Res Function(_$DocentGenerationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? artworkId = null,
    Object? narrativeStyle = freezed,
    Object? preferredLength = freezed,
    Object? includeCompanionContext = null,
    Object? useFewShotExamples = null,
    Object? customPrompt = freezed,
  }) {
    return _then(
      _$DocentGenerationRequestImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        artworkId: null == artworkId
            ? _value.artworkId
            : artworkId // ignore: cast_nullable_to_non_nullable
                  as int,
        narrativeStyle: freezed == narrativeStyle
            ? _value.narrativeStyle
            : narrativeStyle // ignore: cast_nullable_to_non_nullable
                  as NarrativeStyle?,
        preferredLength: freezed == preferredLength
            ? _value.preferredLength
            : preferredLength // ignore: cast_nullable_to_non_nullable
                  as PreferredLength?,
        includeCompanionContext: null == includeCompanionContext
            ? _value.includeCompanionContext
            : includeCompanionContext // ignore: cast_nullable_to_non_nullable
                  as bool,
        useFewShotExamples: null == useFewShotExamples
            ? _value.useFewShotExamples
            : useFewShotExamples // ignore: cast_nullable_to_non_nullable
                  as bool,
        customPrompt: freezed == customPrompt
            ? _value.customPrompt
            : customPrompt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocentGenerationRequestImpl extends _DocentGenerationRequest {
  const _$DocentGenerationRequestImpl({
    required this.userId,
    required this.artworkId,
    this.narrativeStyle,
    this.preferredLength,
    this.includeCompanionContext = false,
    this.useFewShotExamples = true,
    this.customPrompt,
  }) : super._();

  factory _$DocentGenerationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocentGenerationRequestImplFromJson(json);

  @override
  final int userId;
  @override
  final int artworkId;
  @override
  final NarrativeStyle? narrativeStyle;
  // optional, uses user preference if not provided
  @override
  final PreferredLength? preferredLength;
  // optional, uses user preference if not provided
  @override
  @JsonKey()
  final bool includeCompanionContext;
  @override
  @JsonKey()
  final bool useFewShotExamples;
  @override
  final String? customPrompt;

  @override
  String toString() {
    return 'DocentGenerationRequest(userId: $userId, artworkId: $artworkId, narrativeStyle: $narrativeStyle, preferredLength: $preferredLength, includeCompanionContext: $includeCompanionContext, useFewShotExamples: $useFewShotExamples, customPrompt: $customPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentGenerationRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.narrativeStyle, narrativeStyle) ||
                other.narrativeStyle == narrativeStyle) &&
            (identical(other.preferredLength, preferredLength) ||
                other.preferredLength == preferredLength) &&
            (identical(
                  other.includeCompanionContext,
                  includeCompanionContext,
                ) ||
                other.includeCompanionContext == includeCompanionContext) &&
            (identical(other.useFewShotExamples, useFewShotExamples) ||
                other.useFewShotExamples == useFewShotExamples) &&
            (identical(other.customPrompt, customPrompt) ||
                other.customPrompt == customPrompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    artworkId,
    narrativeStyle,
    preferredLength,
    includeCompanionContext,
    useFewShotExamples,
    customPrompt,
  );

  /// Create a copy of DocentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentGenerationRequestImplCopyWith<_$DocentGenerationRequestImpl>
  get copyWith =>
      __$$DocentGenerationRequestImplCopyWithImpl<
        _$DocentGenerationRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentGenerationRequestImplToJson(this);
  }
}

abstract class _DocentGenerationRequest extends DocentGenerationRequest {
  const factory _DocentGenerationRequest({
    required final int userId,
    required final int artworkId,
    final NarrativeStyle? narrativeStyle,
    final PreferredLength? preferredLength,
    final bool includeCompanionContext,
    final bool useFewShotExamples,
    final String? customPrompt,
  }) = _$DocentGenerationRequestImpl;
  const _DocentGenerationRequest._() : super._();

  factory _DocentGenerationRequest.fromJson(Map<String, dynamic> json) =
      _$DocentGenerationRequestImpl.fromJson;

  @override
  int get userId;
  @override
  int get artworkId;
  @override
  NarrativeStyle? get narrativeStyle; // optional, uses user preference if not provided
  @override
  PreferredLength? get preferredLength; // optional, uses user preference if not provided
  @override
  bool get includeCompanionContext;
  @override
  bool get useFewShotExamples;
  @override
  String? get customPrompt;

  /// Create a copy of DocentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentGenerationRequestImplCopyWith<_$DocentGenerationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DocentGenerationResult _$DocentGenerationResultFromJson(
  Map<String, dynamic> json,
) {
  return _DocentGenerationResult.fromJson(json);
}

/// @nodoc
mixin _$DocentGenerationResult {
  int get sessionId => throw _privateConstructorUsedError;
  DocentStatus get status => throw _privateConstructorUsedError;
  DocentSessionEntity? get result => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError; // 0-100 percentage
  String? get pollingUrl =>
      throw _privateConstructorUsedError; // URL to poll for status updates
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DocentGenerationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentGenerationResultCopyWith<DocentGenerationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentGenerationResultCopyWith<$Res> {
  factory $DocentGenerationResultCopyWith(
    DocentGenerationResult value,
    $Res Function(DocentGenerationResult) then,
  ) = _$DocentGenerationResultCopyWithImpl<$Res, DocentGenerationResult>;
  @useResult
  $Res call({
    int sessionId,
    DocentStatus status,
    DocentSessionEntity? result,
    String? errorMessage,
    int? progress,
    String? pollingUrl,
    String? message,
  });

  $DocentSessionEntityCopyWith<$Res>? get result;
}

/// @nodoc
class _$DocentGenerationResultCopyWithImpl<
  $Res,
  $Val extends DocentGenerationResult
>
    implements $DocentGenerationResultCopyWith<$Res> {
  _$DocentGenerationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? status = null,
    Object? result = freezed,
    Object? errorMessage = freezed,
    Object? progress = freezed,
    Object? pollingUrl = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DocentStatus,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as DocentSessionEntity?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            progress: freezed == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as int?,
            pollingUrl: freezed == pollingUrl
                ? _value.pollingUrl
                : pollingUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocentSessionEntityCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $DocentSessionEntityCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocentGenerationResultImplCopyWith<$Res>
    implements $DocentGenerationResultCopyWith<$Res> {
  factory _$$DocentGenerationResultImplCopyWith(
    _$DocentGenerationResultImpl value,
    $Res Function(_$DocentGenerationResultImpl) then,
  ) = __$$DocentGenerationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int sessionId,
    DocentStatus status,
    DocentSessionEntity? result,
    String? errorMessage,
    int? progress,
    String? pollingUrl,
    String? message,
  });

  @override
  $DocentSessionEntityCopyWith<$Res>? get result;
}

/// @nodoc
class __$$DocentGenerationResultImplCopyWithImpl<$Res>
    extends
        _$DocentGenerationResultCopyWithImpl<$Res, _$DocentGenerationResultImpl>
    implements _$$DocentGenerationResultImplCopyWith<$Res> {
  __$$DocentGenerationResultImplCopyWithImpl(
    _$DocentGenerationResultImpl _value,
    $Res Function(_$DocentGenerationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? status = null,
    Object? result = freezed,
    Object? errorMessage = freezed,
    Object? progress = freezed,
    Object? pollingUrl = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$DocentGenerationResultImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DocentStatus,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as DocentSessionEntity?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        progress: freezed == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as int?,
        pollingUrl: freezed == pollingUrl
            ? _value.pollingUrl
            : pollingUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$DocentGenerationResultImpl extends _DocentGenerationResult {
  const _$DocentGenerationResultImpl({
    required this.sessionId,
    required this.status,
    this.result,
    this.errorMessage,
    this.progress,
    this.pollingUrl,
    this.message,
  }) : super._();

  factory _$DocentGenerationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocentGenerationResultImplFromJson(json);

  @override
  final int sessionId;
  @override
  final DocentStatus status;
  @override
  final DocentSessionEntity? result;
  @override
  final String? errorMessage;
  @override
  final int? progress;
  // 0-100 percentage
  @override
  final String? pollingUrl;
  // URL to poll for status updates
  @override
  final String? message;

  @override
  String toString() {
    return 'DocentGenerationResult(sessionId: $sessionId, status: $status, result: $result, errorMessage: $errorMessage, progress: $progress, pollingUrl: $pollingUrl, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentGenerationResultImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.pollingUrl, pollingUrl) ||
                other.pollingUrl == pollingUrl) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    status,
    result,
    errorMessage,
    progress,
    pollingUrl,
    message,
  );

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentGenerationResultImplCopyWith<_$DocentGenerationResultImpl>
  get copyWith =>
      __$$DocentGenerationResultImplCopyWithImpl<_$DocentGenerationResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentGenerationResultImplToJson(this);
  }
}

abstract class _DocentGenerationResult extends DocentGenerationResult {
  const factory _DocentGenerationResult({
    required final int sessionId,
    required final DocentStatus status,
    final DocentSessionEntity? result,
    final String? errorMessage,
    final int? progress,
    final String? pollingUrl,
    final String? message,
  }) = _$DocentGenerationResultImpl;
  const _DocentGenerationResult._() : super._();

  factory _DocentGenerationResult.fromJson(Map<String, dynamic> json) =
      _$DocentGenerationResultImpl.fromJson;

  @override
  int get sessionId;
  @override
  DocentStatus get status;
  @override
  DocentSessionEntity? get result;
  @override
  String? get errorMessage;
  @override
  int? get progress; // 0-100 percentage
  @override
  String? get pollingUrl; // URL to poll for status updates
  @override
  String? get message;

  /// Create a copy of DocentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentGenerationResultImplCopyWith<_$DocentGenerationResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PlaybackStatsRequest _$PlaybackStatsRequestFromJson(Map<String, dynamic> json) {
  return _PlaybackStatsRequest.fromJson(json);
}

/// @nodoc
mixin _$PlaybackStatsRequest {
  int get playCount => throw _privateConstructorUsedError;
  int get totalListeningSeconds => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;

  /// Serializes this PlaybackStatsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaybackStatsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaybackStatsRequestCopyWith<PlaybackStatsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackStatsRequestCopyWith<$Res> {
  factory $PlaybackStatsRequestCopyWith(
    PlaybackStatsRequest value,
    $Res Function(PlaybackStatsRequest) then,
  ) = _$PlaybackStatsRequestCopyWithImpl<$Res, PlaybackStatsRequest>;
  @useResult
  $Res call({int playCount, int totalListeningSeconds, double completionRate});
}

/// @nodoc
class _$PlaybackStatsRequestCopyWithImpl<
  $Res,
  $Val extends PlaybackStatsRequest
>
    implements $PlaybackStatsRequestCopyWith<$Res> {
  _$PlaybackStatsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaybackStatsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playCount = null,
    Object? totalListeningSeconds = null,
    Object? completionRate = null,
  }) {
    return _then(
      _value.copyWith(
            playCount: null == playCount
                ? _value.playCount
                : playCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalListeningSeconds: null == totalListeningSeconds
                ? _value.totalListeningSeconds
                : totalListeningSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaybackStatsRequestImplCopyWith<$Res>
    implements $PlaybackStatsRequestCopyWith<$Res> {
  factory _$$PlaybackStatsRequestImplCopyWith(
    _$PlaybackStatsRequestImpl value,
    $Res Function(_$PlaybackStatsRequestImpl) then,
  ) = __$$PlaybackStatsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int playCount, int totalListeningSeconds, double completionRate});
}

/// @nodoc
class __$$PlaybackStatsRequestImplCopyWithImpl<$Res>
    extends _$PlaybackStatsRequestCopyWithImpl<$Res, _$PlaybackStatsRequestImpl>
    implements _$$PlaybackStatsRequestImplCopyWith<$Res> {
  __$$PlaybackStatsRequestImplCopyWithImpl(
    _$PlaybackStatsRequestImpl _value,
    $Res Function(_$PlaybackStatsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaybackStatsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playCount = null,
    Object? totalListeningSeconds = null,
    Object? completionRate = null,
  }) {
    return _then(
      _$PlaybackStatsRequestImpl(
        playCount: null == playCount
            ? _value.playCount
            : playCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalListeningSeconds: null == totalListeningSeconds
            ? _value.totalListeningSeconds
            : totalListeningSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaybackStatsRequestImpl extends _PlaybackStatsRequest {
  const _$PlaybackStatsRequestImpl({
    required this.playCount,
    required this.totalListeningSeconds,
    required this.completionRate,
  }) : super._();

  factory _$PlaybackStatsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaybackStatsRequestImplFromJson(json);

  @override
  final int playCount;
  @override
  final int totalListeningSeconds;
  @override
  final double completionRate;

  @override
  String toString() {
    return 'PlaybackStatsRequest(playCount: $playCount, totalListeningSeconds: $totalListeningSeconds, completionRate: $completionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackStatsRequestImpl &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.totalListeningSeconds, totalListeningSeconds) ||
                other.totalListeningSeconds == totalListeningSeconds) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playCount,
    totalListeningSeconds,
    completionRate,
  );

  /// Create a copy of PlaybackStatsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackStatsRequestImplCopyWith<_$PlaybackStatsRequestImpl>
  get copyWith =>
      __$$PlaybackStatsRequestImplCopyWithImpl<_$PlaybackStatsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaybackStatsRequestImplToJson(this);
  }
}

abstract class _PlaybackStatsRequest extends PlaybackStatsRequest {
  const factory _PlaybackStatsRequest({
    required final int playCount,
    required final int totalListeningSeconds,
    required final double completionRate,
  }) = _$PlaybackStatsRequestImpl;
  const _PlaybackStatsRequest._() : super._();

  factory _PlaybackStatsRequest.fromJson(Map<String, dynamic> json) =
      _$PlaybackStatsRequestImpl.fromJson;

  @override
  int get playCount;
  @override
  int get totalListeningSeconds;
  @override
  double get completionRate;

  /// Create a copy of PlaybackStatsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaybackStatsRequestImplCopyWith<_$PlaybackStatsRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
