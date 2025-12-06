// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docent_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FewShotExampleResponse _$FewShotExampleResponseFromJson(
  Map<String, dynamic> json,
) {
  return _FewShotExampleResponse.fromJson(json);
}

/// @nodoc
mixin _$FewShotExampleResponse {
  String get userContextSummary => throw _privateConstructorUsedError;
  String get exemplarText => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;

  /// Serializes this FewShotExampleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FewShotExampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FewShotExampleResponseCopyWith<FewShotExampleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FewShotExampleResponseCopyWith<$Res> {
  factory $FewShotExampleResponseCopyWith(
    FewShotExampleResponse value,
    $Res Function(FewShotExampleResponse) then,
  ) = _$FewShotExampleResponseCopyWithImpl<$Res, FewShotExampleResponse>;
  @useResult
  $Res call({
    String userContextSummary,
    String exemplarText,
    double qualityScore,
  });
}

/// @nodoc
class _$FewShotExampleResponseCopyWithImpl<
  $Res,
  $Val extends FewShotExampleResponse
>
    implements $FewShotExampleResponseCopyWith<$Res> {
  _$FewShotExampleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FewShotExampleResponse
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
abstract class _$$FewShotExampleResponseImplCopyWith<$Res>
    implements $FewShotExampleResponseCopyWith<$Res> {
  factory _$$FewShotExampleResponseImplCopyWith(
    _$FewShotExampleResponseImpl value,
    $Res Function(_$FewShotExampleResponseImpl) then,
  ) = __$$FewShotExampleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userContextSummary,
    String exemplarText,
    double qualityScore,
  });
}

/// @nodoc
class __$$FewShotExampleResponseImplCopyWithImpl<$Res>
    extends
        _$FewShotExampleResponseCopyWithImpl<$Res, _$FewShotExampleResponseImpl>
    implements _$$FewShotExampleResponseImplCopyWith<$Res> {
  __$$FewShotExampleResponseImplCopyWithImpl(
    _$FewShotExampleResponseImpl _value,
    $Res Function(_$FewShotExampleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FewShotExampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userContextSummary = null,
    Object? exemplarText = null,
    Object? qualityScore = null,
  }) {
    return _then(
      _$FewShotExampleResponseImpl(
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
class _$FewShotExampleResponseImpl extends _FewShotExampleResponse {
  const _$FewShotExampleResponseImpl({
    required this.userContextSummary,
    required this.exemplarText,
    required this.qualityScore,
  }) : super._();

  factory _$FewShotExampleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FewShotExampleResponseImplFromJson(json);

  @override
  final String userContextSummary;
  @override
  final String exemplarText;
  @override
  final double qualityScore;

  @override
  String toString() {
    return 'FewShotExampleResponse(userContextSummary: $userContextSummary, exemplarText: $exemplarText, qualityScore: $qualityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FewShotExampleResponseImpl &&
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

  /// Create a copy of FewShotExampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FewShotExampleResponseImplCopyWith<_$FewShotExampleResponseImpl>
  get copyWith =>
      __$$FewShotExampleResponseImplCopyWithImpl<_$FewShotExampleResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FewShotExampleResponseImplToJson(this);
  }
}

abstract class _FewShotExampleResponse extends FewShotExampleResponse {
  const factory _FewShotExampleResponse({
    required final String userContextSummary,
    required final String exemplarText,
    required final double qualityScore,
  }) = _$FewShotExampleResponseImpl;
  const _FewShotExampleResponse._() : super._();

  factory _FewShotExampleResponse.fromJson(Map<String, dynamic> json) =
      _$FewShotExampleResponseImpl.fromJson;

  @override
  String get userContextSummary;
  @override
  String get exemplarText;
  @override
  double get qualityScore;

  /// Create a copy of FewShotExampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FewShotExampleResponseImplCopyWith<_$FewShotExampleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DocentSessionResponse _$DocentSessionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DocentSessionResponse.fromJson(json);
}

/// @nodoc
mixin _$DocentSessionResponse {
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
  List<FewShotExampleResponse> get fewShotExamples =>
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
  String get status => throw _privateConstructorUsedError; // Timestamps
  String get createdAt => throw _privateConstructorUsedError;
  String? get lastPlayedAt => throw _privateConstructorUsedError;

  /// Serializes this DocentSessionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentSessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentSessionResponseCopyWith<DocentSessionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentSessionResponseCopyWith<$Res> {
  factory $DocentSessionResponseCopyWith(
    DocentSessionResponse value,
    $Res Function(DocentSessionResponse) then,
  ) = _$DocentSessionResponseCopyWithImpl<$Res, DocentSessionResponse>;
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
    List<FewShotExampleResponse> fewShotExamples,
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
    String status,
    String createdAt,
    String? lastPlayedAt,
  });
}

/// @nodoc
class _$DocentSessionResponseCopyWithImpl<
  $Res,
  $Val extends DocentSessionResponse
>
    implements $DocentSessionResponseCopyWith<$Res> {
  _$DocentSessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentSessionResponse
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
                      as List<FewShotExampleResponse>,
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
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            lastPlayedAt: freezed == lastPlayedAt
                ? _value.lastPlayedAt
                : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocentSessionResponseImplCopyWith<$Res>
    implements $DocentSessionResponseCopyWith<$Res> {
  factory _$$DocentSessionResponseImplCopyWith(
    _$DocentSessionResponseImpl value,
    $Res Function(_$DocentSessionResponseImpl) then,
  ) = __$$DocentSessionResponseImplCopyWithImpl<$Res>;
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
    List<FewShotExampleResponse> fewShotExamples,
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
    String status,
    String createdAt,
    String? lastPlayedAt,
  });
}

/// @nodoc
class __$$DocentSessionResponseImplCopyWithImpl<$Res>
    extends
        _$DocentSessionResponseCopyWithImpl<$Res, _$DocentSessionResponseImpl>
    implements _$$DocentSessionResponseImplCopyWith<$Res> {
  __$$DocentSessionResponseImplCopyWithImpl(
    _$DocentSessionResponseImpl _value,
    $Res Function(_$DocentSessionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentSessionResponse
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
      _$DocentSessionResponseImpl(
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
                  as List<FewShotExampleResponse>,
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
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        lastPlayedAt: freezed == lastPlayedAt
            ? _value.lastPlayedAt
            : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocentSessionResponseImpl extends _DocentSessionResponse {
  const _$DocentSessionResponseImpl({
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
    final List<FewShotExampleResponse> fewShotExamples = const [],
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

  factory _$DocentSessionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocentSessionResponseImplFromJson(json);

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
  final List<FewShotExampleResponse> _fewShotExamples;
  @override
  @JsonKey()
  List<FewShotExampleResponse> get fewShotExamples {
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
  final String status;
  // Timestamps
  @override
  final String createdAt;
  @override
  final String? lastPlayedAt;

  @override
  String toString() {
    return 'DocentSessionResponse(id: $id, userId: $userId, artworkId: $artworkId, artworkTitle: $artworkTitle, artworkArtist: $artworkArtist, artworkImageUrl: $artworkImageUrl, promptTemplate: $promptTemplate, promptPersona: $promptPersona, promptTask: $promptTask, promptContext: $promptContext, promptForm: $promptForm, fewShotExamples: $fewShotExamples, generatedText: $generatedText, geminiModel: $geminiModel, geminiTemperature: $geminiTemperature, geminiTopP: $geminiTopP, geminiTopK: $geminiTopK, generationTimeMs: $generationTimeMs, ttsAudioUrl: $ttsAudioUrl, ttsDurationSeconds: $ttsDurationSeconds, playCount: $playCount, totalListeningSeconds: $totalListeningSeconds, completionRate: $completionRate, status: $status, createdAt: $createdAt, lastPlayedAt: $lastPlayedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentSessionResponseImpl &&
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

  /// Create a copy of DocentSessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentSessionResponseImplCopyWith<_$DocentSessionResponseImpl>
  get copyWith =>
      __$$DocentSessionResponseImplCopyWithImpl<_$DocentSessionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentSessionResponseImplToJson(this);
  }
}

abstract class _DocentSessionResponse extends DocentSessionResponse {
  const factory _DocentSessionResponse({
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
    final List<FewShotExampleResponse> fewShotExamples,
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
    required final String status,
    required final String createdAt,
    final String? lastPlayedAt,
  }) = _$DocentSessionResponseImpl;
  const _DocentSessionResponse._() : super._();

  factory _DocentSessionResponse.fromJson(Map<String, dynamic> json) =
      _$DocentSessionResponseImpl.fromJson;

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
  List<FewShotExampleResponse> get fewShotExamples; // Generated content
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
  String get status; // Timestamps
  @override
  String get createdAt;
  @override
  String? get lastPlayedAt;

  /// Create a copy of DocentSessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentSessionResponseImplCopyWith<_$DocentSessionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DocentGenerationResultResponse _$DocentGenerationResultResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DocentGenerationResultResponse.fromJson(json);
}

/// @nodoc
mixin _$DocentGenerationResultResponse {
  int get sessionId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DocentSessionResponse? get result => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  String? get pollingUrl => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DocentGenerationResultResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentGenerationResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentGenerationResultResponseCopyWith<DocentGenerationResultResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentGenerationResultResponseCopyWith<$Res> {
  factory $DocentGenerationResultResponseCopyWith(
    DocentGenerationResultResponse value,
    $Res Function(DocentGenerationResultResponse) then,
  ) =
      _$DocentGenerationResultResponseCopyWithImpl<
        $Res,
        DocentGenerationResultResponse
      >;
  @useResult
  $Res call({
    int sessionId,
    String status,
    DocentSessionResponse? result,
    String? errorMessage,
    int? progress,
    String? pollingUrl,
    String? message,
  });

  $DocentSessionResponseCopyWith<$Res>? get result;
}

/// @nodoc
class _$DocentGenerationResultResponseCopyWithImpl<
  $Res,
  $Val extends DocentGenerationResultResponse
>
    implements $DocentGenerationResultResponseCopyWith<$Res> {
  _$DocentGenerationResultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentGenerationResultResponse
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
                      as String,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as DocentSessionResponse?,
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

  /// Create a copy of DocentGenerationResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocentSessionResponseCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $DocentSessionResponseCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocentGenerationResultResponseImplCopyWith<$Res>
    implements $DocentGenerationResultResponseCopyWith<$Res> {
  factory _$$DocentGenerationResultResponseImplCopyWith(
    _$DocentGenerationResultResponseImpl value,
    $Res Function(_$DocentGenerationResultResponseImpl) then,
  ) = __$$DocentGenerationResultResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int sessionId,
    String status,
    DocentSessionResponse? result,
    String? errorMessage,
    int? progress,
    String? pollingUrl,
    String? message,
  });

  @override
  $DocentSessionResponseCopyWith<$Res>? get result;
}

/// @nodoc
class __$$DocentGenerationResultResponseImplCopyWithImpl<$Res>
    extends
        _$DocentGenerationResultResponseCopyWithImpl<
          $Res,
          _$DocentGenerationResultResponseImpl
        >
    implements _$$DocentGenerationResultResponseImplCopyWith<$Res> {
  __$$DocentGenerationResultResponseImplCopyWithImpl(
    _$DocentGenerationResultResponseImpl _value,
    $Res Function(_$DocentGenerationResultResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentGenerationResultResponse
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
      _$DocentGenerationResultResponseImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as DocentSessionResponse?,
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
class _$DocentGenerationResultResponseImpl
    extends _DocentGenerationResultResponse {
  const _$DocentGenerationResultResponseImpl({
    required this.sessionId,
    required this.status,
    this.result,
    this.errorMessage,
    this.progress,
    this.pollingUrl,
    this.message,
  }) : super._();

  factory _$DocentGenerationResultResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$DocentGenerationResultResponseImplFromJson(json);

  @override
  final int sessionId;
  @override
  final String status;
  @override
  final DocentSessionResponse? result;
  @override
  final String? errorMessage;
  @override
  final int? progress;
  @override
  final String? pollingUrl;
  @override
  final String? message;

  @override
  String toString() {
    return 'DocentGenerationResultResponse(sessionId: $sessionId, status: $status, result: $result, errorMessage: $errorMessage, progress: $progress, pollingUrl: $pollingUrl, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentGenerationResultResponseImpl &&
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

  /// Create a copy of DocentGenerationResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentGenerationResultResponseImplCopyWith<
    _$DocentGenerationResultResponseImpl
  >
  get copyWith =>
      __$$DocentGenerationResultResponseImplCopyWithImpl<
        _$DocentGenerationResultResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentGenerationResultResponseImplToJson(this);
  }
}

abstract class _DocentGenerationResultResponse
    extends DocentGenerationResultResponse {
  const factory _DocentGenerationResultResponse({
    required final int sessionId,
    required final String status,
    final DocentSessionResponse? result,
    final String? errorMessage,
    final int? progress,
    final String? pollingUrl,
    final String? message,
  }) = _$DocentGenerationResultResponseImpl;
  const _DocentGenerationResultResponse._() : super._();

  factory _DocentGenerationResultResponse.fromJson(Map<String, dynamic> json) =
      _$DocentGenerationResultResponseImpl.fromJson;

  @override
  int get sessionId;
  @override
  String get status;
  @override
  DocentSessionResponse? get result;
  @override
  String? get errorMessage;
  @override
  int? get progress;
  @override
  String? get pollingUrl;
  @override
  String? get message;

  /// Create a copy of DocentGenerationResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentGenerationResultResponseImplCopyWith<
    _$DocentGenerationResultResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

DocentApiResponse _$DocentApiResponseFromJson(Map<String, dynamic> json) {
  return _DocentApiResponse.fromJson(json);
}

/// @nodoc
mixin _$DocentApiResponse {
  bool get success => throw _privateConstructorUsedError;
  DocentSessionResponse? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DocentApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentApiResponseCopyWith<DocentApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentApiResponseCopyWith<$Res> {
  factory $DocentApiResponseCopyWith(
    DocentApiResponse value,
    $Res Function(DocentApiResponse) then,
  ) = _$DocentApiResponseCopyWithImpl<$Res, DocentApiResponse>;
  @useResult
  $Res call({bool success, DocentSessionResponse? data, String? message});

  $DocentSessionResponseCopyWith<$Res>? get data;
}

/// @nodoc
class _$DocentApiResponseCopyWithImpl<$Res, $Val extends DocentApiResponse>
    implements $DocentApiResponseCopyWith<$Res> {
  _$DocentApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as DocentSessionResponse?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocentSessionResponseCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DocentSessionResponseCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocentApiResponseImplCopyWith<$Res>
    implements $DocentApiResponseCopyWith<$Res> {
  factory _$$DocentApiResponseImplCopyWith(
    _$DocentApiResponseImpl value,
    $Res Function(_$DocentApiResponseImpl) then,
  ) = __$$DocentApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, DocentSessionResponse? data, String? message});

  @override
  $DocentSessionResponseCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DocentApiResponseImplCopyWithImpl<$Res>
    extends _$DocentApiResponseCopyWithImpl<$Res, _$DocentApiResponseImpl>
    implements _$$DocentApiResponseImplCopyWith<$Res> {
  __$$DocentApiResponseImplCopyWithImpl(
    _$DocentApiResponseImpl _value,
    $Res Function(_$DocentApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$DocentApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as DocentSessionResponse?,
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
class _$DocentApiResponseImpl extends _DocentApiResponse {
  const _$DocentApiResponseImpl({
    required this.success,
    this.data,
    this.message,
  }) : super._();

  factory _$DocentApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocentApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final DocentSessionResponse? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'DocentApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentApiResponseImplCopyWith<_$DocentApiResponseImpl> get copyWith =>
      __$$DocentApiResponseImplCopyWithImpl<_$DocentApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentApiResponseImplToJson(this);
  }
}

abstract class _DocentApiResponse extends DocentApiResponse {
  const factory _DocentApiResponse({
    required final bool success,
    final DocentSessionResponse? data,
    final String? message,
  }) = _$DocentApiResponseImpl;
  const _DocentApiResponse._() : super._();

  factory _DocentApiResponse.fromJson(Map<String, dynamic> json) =
      _$DocentApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  DocentSessionResponse? get data;
  @override
  String? get message;

  /// Create a copy of DocentApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentApiResponseImplCopyWith<_$DocentApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocentGenerationApiResponse _$DocentGenerationApiResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DocentGenerationApiResponse.fromJson(json);
}

/// @nodoc
mixin _$DocentGenerationApiResponse {
  bool get success => throw _privateConstructorUsedError;
  DocentGenerationResultResponse? get data =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DocentGenerationApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocentGenerationApiResponseCopyWith<DocentGenerationApiResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentGenerationApiResponseCopyWith<$Res> {
  factory $DocentGenerationApiResponseCopyWith(
    DocentGenerationApiResponse value,
    $Res Function(DocentGenerationApiResponse) then,
  ) =
      _$DocentGenerationApiResponseCopyWithImpl<
        $Res,
        DocentGenerationApiResponse
      >;
  @useResult
  $Res call({
    bool success,
    DocentGenerationResultResponse? data,
    String? message,
  });

  $DocentGenerationResultResponseCopyWith<$Res>? get data;
}

/// @nodoc
class _$DocentGenerationApiResponseCopyWithImpl<
  $Res,
  $Val extends DocentGenerationApiResponse
>
    implements $DocentGenerationApiResponseCopyWith<$Res> {
  _$DocentGenerationApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as DocentGenerationResultResponse?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocentGenerationResultResponseCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DocentGenerationResultResponseCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocentGenerationApiResponseImplCopyWith<$Res>
    implements $DocentGenerationApiResponseCopyWith<$Res> {
  factory _$$DocentGenerationApiResponseImplCopyWith(
    _$DocentGenerationApiResponseImpl value,
    $Res Function(_$DocentGenerationApiResponseImpl) then,
  ) = __$$DocentGenerationApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    DocentGenerationResultResponse? data,
    String? message,
  });

  @override
  $DocentGenerationResultResponseCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DocentGenerationApiResponseImplCopyWithImpl<$Res>
    extends
        _$DocentGenerationApiResponseCopyWithImpl<
          $Res,
          _$DocentGenerationApiResponseImpl
        >
    implements _$$DocentGenerationApiResponseImplCopyWith<$Res> {
  __$$DocentGenerationApiResponseImplCopyWithImpl(
    _$DocentGenerationApiResponseImpl _value,
    $Res Function(_$DocentGenerationApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$DocentGenerationApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as DocentGenerationResultResponse?,
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
class _$DocentGenerationApiResponseImpl extends _DocentGenerationApiResponse {
  const _$DocentGenerationApiResponseImpl({
    required this.success,
    this.data,
    this.message,
  }) : super._();

  factory _$DocentGenerationApiResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$DocentGenerationApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final DocentGenerationResultResponse? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'DocentGenerationApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocentGenerationApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocentGenerationApiResponseImplCopyWith<_$DocentGenerationApiResponseImpl>
  get copyWith =>
      __$$DocentGenerationApiResponseImplCopyWithImpl<
        _$DocentGenerationApiResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocentGenerationApiResponseImplToJson(this);
  }
}

abstract class _DocentGenerationApiResponse
    extends DocentGenerationApiResponse {
  const factory _DocentGenerationApiResponse({
    required final bool success,
    final DocentGenerationResultResponse? data,
    final String? message,
  }) = _$DocentGenerationApiResponseImpl;
  const _DocentGenerationApiResponse._() : super._();

  factory _DocentGenerationApiResponse.fromJson(Map<String, dynamic> json) =
      _$DocentGenerationApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  DocentGenerationResultResponse? get data;
  @override
  String? get message;

  /// Create a copy of DocentGenerationApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocentGenerationApiResponseImplCopyWith<_$DocentGenerationApiResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
