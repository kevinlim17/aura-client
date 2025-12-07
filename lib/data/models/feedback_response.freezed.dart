// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImprovementSuggestionsResponse _$ImprovementSuggestionsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ImprovementSuggestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$ImprovementSuggestionsResponse {
  String? get length => throw _privateConstructorUsedError;
  String? get style => throw _privateConstructorUsedError;

  /// Serializes this ImprovementSuggestionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImprovementSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImprovementSuggestionsResponseCopyWith<ImprovementSuggestionsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprovementSuggestionsResponseCopyWith<$Res> {
  factory $ImprovementSuggestionsResponseCopyWith(
    ImprovementSuggestionsResponse value,
    $Res Function(ImprovementSuggestionsResponse) then,
  ) =
      _$ImprovementSuggestionsResponseCopyWithImpl<
        $Res,
        ImprovementSuggestionsResponse
      >;
  @useResult
  $Res call({String? length, String? style});
}

/// @nodoc
class _$ImprovementSuggestionsResponseCopyWithImpl<
  $Res,
  $Val extends ImprovementSuggestionsResponse
>
    implements $ImprovementSuggestionsResponseCopyWith<$Res> {
  _$ImprovementSuggestionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImprovementSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? length = freezed, Object? style = freezed}) {
    return _then(
      _value.copyWith(
            length: freezed == length
                ? _value.length
                : length // ignore: cast_nullable_to_non_nullable
                      as String?,
            style: freezed == style
                ? _value.style
                : style // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImprovementSuggestionsResponseImplCopyWith<$Res>
    implements $ImprovementSuggestionsResponseCopyWith<$Res> {
  factory _$$ImprovementSuggestionsResponseImplCopyWith(
    _$ImprovementSuggestionsResponseImpl value,
    $Res Function(_$ImprovementSuggestionsResponseImpl) then,
  ) = __$$ImprovementSuggestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? length, String? style});
}

/// @nodoc
class __$$ImprovementSuggestionsResponseImplCopyWithImpl<$Res>
    extends
        _$ImprovementSuggestionsResponseCopyWithImpl<
          $Res,
          _$ImprovementSuggestionsResponseImpl
        >
    implements _$$ImprovementSuggestionsResponseImplCopyWith<$Res> {
  __$$ImprovementSuggestionsResponseImplCopyWithImpl(
    _$ImprovementSuggestionsResponseImpl _value,
    $Res Function(_$ImprovementSuggestionsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImprovementSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? length = freezed, Object? style = freezed}) {
    return _then(
      _$ImprovementSuggestionsResponseImpl(
        length: freezed == length
            ? _value.length
            : length // ignore: cast_nullable_to_non_nullable
                  as String?,
        style: freezed == style
            ? _value.style
            : style // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImprovementSuggestionsResponseImpl
    extends _ImprovementSuggestionsResponse {
  const _$ImprovementSuggestionsResponseImpl({this.length, this.style})
    : super._();

  factory _$ImprovementSuggestionsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ImprovementSuggestionsResponseImplFromJson(json);

  @override
  final String? length;
  @override
  final String? style;

  @override
  String toString() {
    return 'ImprovementSuggestionsResponse(length: $length, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImprovementSuggestionsResponseImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, length, style);

  /// Create a copy of ImprovementSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImprovementSuggestionsResponseImplCopyWith<
    _$ImprovementSuggestionsResponseImpl
  >
  get copyWith =>
      __$$ImprovementSuggestionsResponseImplCopyWithImpl<
        _$ImprovementSuggestionsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImprovementSuggestionsResponseImplToJson(this);
  }
}

abstract class _ImprovementSuggestionsResponse
    extends ImprovementSuggestionsResponse {
  const factory _ImprovementSuggestionsResponse({
    final String? length,
    final String? style,
  }) = _$ImprovementSuggestionsResponseImpl;
  const _ImprovementSuggestionsResponse._() : super._();

  factory _ImprovementSuggestionsResponse.fromJson(Map<String, dynamic> json) =
      _$ImprovementSuggestionsResponseImpl.fromJson;

  @override
  String? get length;
  @override
  String? get style;

  /// Create a copy of ImprovementSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImprovementSuggestionsResponseImplCopyWith<
    _$ImprovementSuggestionsResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

FeedbackResponse _$FeedbackResponseFromJson(Map<String, dynamic> json) {
  return _FeedbackResponse.fromJson(json);
}

/// @nodoc
mixin _$FeedbackResponse {
  int get id => throw _privateConstructorUsedError;
  int get docentSessionId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get emotionalResonance => throw _privateConstructorUsedError;
  int? get imaginativeEngagement => throw _privateConstructorUsedError;
  int? get emotionalImpact => throw _privateConstructorUsedError;
  double get overallSatisfaction => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ImprovementSuggestionsResponse? get improvementSuggestions =>
      throw _privateConstructorUsedError;
  bool get isFewShotCandidate => throw _privateConstructorUsedError;
  DateTime? get fewShotSelectedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedbackResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackResponseCopyWith<FeedbackResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackResponseCopyWith<$Res> {
  factory $FeedbackResponseCopyWith(
    FeedbackResponse value,
    $Res Function(FeedbackResponse) then,
  ) = _$FeedbackResponseCopyWithImpl<$Res, FeedbackResponse>;
  @useResult
  $Res call({
    int id,
    int docentSessionId,
    int userId,
    int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    double overallSatisfaction,
    String? comment,
    ImprovementSuggestionsResponse? improvementSuggestions,
    bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    DateTime createdAt,
  });

  $ImprovementSuggestionsResponseCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class _$FeedbackResponseCopyWithImpl<$Res, $Val extends FeedbackResponse>
    implements $FeedbackResponseCopyWith<$Res> {
  _$FeedbackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docentSessionId = null,
    Object? userId = null,
    Object? emotionalResonance = null,
    Object? imaginativeEngagement = freezed,
    Object? emotionalImpact = freezed,
    Object? overallSatisfaction = null,
    Object? comment = freezed,
    Object? improvementSuggestions = freezed,
    Object? isFewShotCandidate = null,
    Object? fewShotSelectedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            docentSessionId: null == docentSessionId
                ? _value.docentSessionId
                : docentSessionId // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            emotionalResonance: null == emotionalResonance
                ? _value.emotionalResonance
                : emotionalResonance // ignore: cast_nullable_to_non_nullable
                      as int,
            imaginativeEngagement: freezed == imaginativeEngagement
                ? _value.imaginativeEngagement
                : imaginativeEngagement // ignore: cast_nullable_to_non_nullable
                      as int?,
            emotionalImpact: freezed == emotionalImpact
                ? _value.emotionalImpact
                : emotionalImpact // ignore: cast_nullable_to_non_nullable
                      as int?,
            overallSatisfaction: null == overallSatisfaction
                ? _value.overallSatisfaction
                : overallSatisfaction // ignore: cast_nullable_to_non_nullable
                      as double,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            improvementSuggestions: freezed == improvementSuggestions
                ? _value.improvementSuggestions
                : improvementSuggestions // ignore: cast_nullable_to_non_nullable
                      as ImprovementSuggestionsResponse?,
            isFewShotCandidate: null == isFewShotCandidate
                ? _value.isFewShotCandidate
                : isFewShotCandidate // ignore: cast_nullable_to_non_nullable
                      as bool,
            fewShotSelectedAt: freezed == fewShotSelectedAt
                ? _value.fewShotSelectedAt
                : fewShotSelectedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImprovementSuggestionsResponseCopyWith<$Res>? get improvementSuggestions {
    if (_value.improvementSuggestions == null) {
      return null;
    }

    return $ImprovementSuggestionsResponseCopyWith<$Res>(
      _value.improvementSuggestions!,
      (value) {
        return _then(_value.copyWith(improvementSuggestions: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$FeedbackResponseImplCopyWith<$Res>
    implements $FeedbackResponseCopyWith<$Res> {
  factory _$$FeedbackResponseImplCopyWith(
    _$FeedbackResponseImpl value,
    $Res Function(_$FeedbackResponseImpl) then,
  ) = __$$FeedbackResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int docentSessionId,
    int userId,
    int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    double overallSatisfaction,
    String? comment,
    ImprovementSuggestionsResponse? improvementSuggestions,
    bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    DateTime createdAt,
  });

  @override
  $ImprovementSuggestionsResponseCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class __$$FeedbackResponseImplCopyWithImpl<$Res>
    extends _$FeedbackResponseCopyWithImpl<$Res, _$FeedbackResponseImpl>
    implements _$$FeedbackResponseImplCopyWith<$Res> {
  __$$FeedbackResponseImplCopyWithImpl(
    _$FeedbackResponseImpl _value,
    $Res Function(_$FeedbackResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docentSessionId = null,
    Object? userId = null,
    Object? emotionalResonance = null,
    Object? imaginativeEngagement = freezed,
    Object? emotionalImpact = freezed,
    Object? overallSatisfaction = null,
    Object? comment = freezed,
    Object? improvementSuggestions = freezed,
    Object? isFewShotCandidate = null,
    Object? fewShotSelectedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$FeedbackResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        docentSessionId: null == docentSessionId
            ? _value.docentSessionId
            : docentSessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        emotionalResonance: null == emotionalResonance
            ? _value.emotionalResonance
            : emotionalResonance // ignore: cast_nullable_to_non_nullable
                  as int,
        imaginativeEngagement: freezed == imaginativeEngagement
            ? _value.imaginativeEngagement
            : imaginativeEngagement // ignore: cast_nullable_to_non_nullable
                  as int?,
        emotionalImpact: freezed == emotionalImpact
            ? _value.emotionalImpact
            : emotionalImpact // ignore: cast_nullable_to_non_nullable
                  as int?,
        overallSatisfaction: null == overallSatisfaction
            ? _value.overallSatisfaction
            : overallSatisfaction // ignore: cast_nullable_to_non_nullable
                  as double,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        improvementSuggestions: freezed == improvementSuggestions
            ? _value.improvementSuggestions
            : improvementSuggestions // ignore: cast_nullable_to_non_nullable
                  as ImprovementSuggestionsResponse?,
        isFewShotCandidate: null == isFewShotCandidate
            ? _value.isFewShotCandidate
            : isFewShotCandidate // ignore: cast_nullable_to_non_nullable
                  as bool,
        fewShotSelectedAt: freezed == fewShotSelectedAt
            ? _value.fewShotSelectedAt
            : fewShotSelectedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackResponseImpl extends _FeedbackResponse {
  const _$FeedbackResponseImpl({
    required this.id,
    required this.docentSessionId,
    required this.userId,
    required this.emotionalResonance,
    this.imaginativeEngagement,
    this.emotionalImpact,
    required this.overallSatisfaction,
    this.comment,
    this.improvementSuggestions,
    required this.isFewShotCandidate,
    this.fewShotSelectedAt,
    required this.createdAt,
  }) : super._();

  factory _$FeedbackResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int docentSessionId;
  @override
  final int userId;
  @override
  final int emotionalResonance;
  @override
  final int? imaginativeEngagement;
  @override
  final int? emotionalImpact;
  @override
  final double overallSatisfaction;
  @override
  final String? comment;
  @override
  final ImprovementSuggestionsResponse? improvementSuggestions;
  @override
  final bool isFewShotCandidate;
  @override
  final DateTime? fewShotSelectedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'FeedbackResponse(id: $id, docentSessionId: $docentSessionId, userId: $userId, emotionalResonance: $emotionalResonance, imaginativeEngagement: $imaginativeEngagement, emotionalImpact: $emotionalImpact, overallSatisfaction: $overallSatisfaction, comment: $comment, improvementSuggestions: $improvementSuggestions, isFewShotCandidate: $isFewShotCandidate, fewShotSelectedAt: $fewShotSelectedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.docentSessionId, docentSessionId) ||
                other.docentSessionId == docentSessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.emotionalResonance, emotionalResonance) ||
                other.emotionalResonance == emotionalResonance) &&
            (identical(other.imaginativeEngagement, imaginativeEngagement) ||
                other.imaginativeEngagement == imaginativeEngagement) &&
            (identical(other.emotionalImpact, emotionalImpact) ||
                other.emotionalImpact == emotionalImpact) &&
            (identical(other.overallSatisfaction, overallSatisfaction) ||
                other.overallSatisfaction == overallSatisfaction) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.improvementSuggestions, improvementSuggestions) ||
                other.improvementSuggestions == improvementSuggestions) &&
            (identical(other.isFewShotCandidate, isFewShotCandidate) ||
                other.isFewShotCandidate == isFewShotCandidate) &&
            (identical(other.fewShotSelectedAt, fewShotSelectedAt) ||
                other.fewShotSelectedAt == fewShotSelectedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    docentSessionId,
    userId,
    emotionalResonance,
    imaginativeEngagement,
    emotionalImpact,
    overallSatisfaction,
    comment,
    improvementSuggestions,
    isFewShotCandidate,
    fewShotSelectedAt,
    createdAt,
  );

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackResponseImplCopyWith<_$FeedbackResponseImpl> get copyWith =>
      __$$FeedbackResponseImplCopyWithImpl<_$FeedbackResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackResponseImplToJson(this);
  }
}

abstract class _FeedbackResponse extends FeedbackResponse {
  const factory _FeedbackResponse({
    required final int id,
    required final int docentSessionId,
    required final int userId,
    required final int emotionalResonance,
    final int? imaginativeEngagement,
    final int? emotionalImpact,
    required final double overallSatisfaction,
    final String? comment,
    final ImprovementSuggestionsResponse? improvementSuggestions,
    required final bool isFewShotCandidate,
    final DateTime? fewShotSelectedAt,
    required final DateTime createdAt,
  }) = _$FeedbackResponseImpl;
  const _FeedbackResponse._() : super._();

  factory _FeedbackResponse.fromJson(Map<String, dynamic> json) =
      _$FeedbackResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get docentSessionId;
  @override
  int get userId;
  @override
  int get emotionalResonance;
  @override
  int? get imaginativeEngagement;
  @override
  int? get emotionalImpact;
  @override
  double get overallSatisfaction;
  @override
  String? get comment;
  @override
  ImprovementSuggestionsResponse? get improvementSuggestions;
  @override
  bool get isFewShotCandidate;
  @override
  DateTime? get fewShotSelectedAt;
  @override
  DateTime get createdAt;

  /// Create a copy of FeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackResponseImplCopyWith<_$FeedbackResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackApiResponse _$FeedbackApiResponseFromJson(Map<String, dynamic> json) {
  return _FeedbackApiResponse.fromJson(json);
}

/// @nodoc
mixin _$FeedbackApiResponse {
  bool get success => throw _privateConstructorUsedError;
  FeedbackResponse get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this FeedbackApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackApiResponseCopyWith<FeedbackApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackApiResponseCopyWith<$Res> {
  factory $FeedbackApiResponseCopyWith(
    FeedbackApiResponse value,
    $Res Function(FeedbackApiResponse) then,
  ) = _$FeedbackApiResponseCopyWithImpl<$Res, FeedbackApiResponse>;
  @useResult
  $Res call({bool success, FeedbackResponse data, String? message});

  $FeedbackResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$FeedbackApiResponseCopyWithImpl<$Res, $Val extends FeedbackApiResponse>
    implements $FeedbackApiResponseCopyWith<$Res> {
  _$FeedbackApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackApiResponse
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
                      as FeedbackResponse,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of FeedbackApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedbackResponseCopyWith<$Res> get data {
    return $FeedbackResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackApiResponseImplCopyWith<$Res>
    implements $FeedbackApiResponseCopyWith<$Res> {
  factory _$$FeedbackApiResponseImplCopyWith(
    _$FeedbackApiResponseImpl value,
    $Res Function(_$FeedbackApiResponseImpl) then,
  ) = __$$FeedbackApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, FeedbackResponse data, String? message});

  @override
  $FeedbackResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$FeedbackApiResponseImplCopyWithImpl<$Res>
    extends _$FeedbackApiResponseCopyWithImpl<$Res, _$FeedbackApiResponseImpl>
    implements _$$FeedbackApiResponseImplCopyWith<$Res> {
  __$$FeedbackApiResponseImplCopyWithImpl(
    _$FeedbackApiResponseImpl _value,
    $Res Function(_$FeedbackApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(
      _$FeedbackApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as FeedbackResponse,
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
class _$FeedbackApiResponseImpl extends _FeedbackApiResponse {
  const _$FeedbackApiResponseImpl({
    required this.success,
    required this.data,
    this.message,
  }) : super._();

  factory _$FeedbackApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final FeedbackResponse data;
  @override
  final String? message;

  @override
  String toString() {
    return 'FeedbackApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of FeedbackApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackApiResponseImplCopyWith<_$FeedbackApiResponseImpl> get copyWith =>
      __$$FeedbackApiResponseImplCopyWithImpl<_$FeedbackApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackApiResponseImplToJson(this);
  }
}

abstract class _FeedbackApiResponse extends FeedbackApiResponse {
  const factory _FeedbackApiResponse({
    required final bool success,
    required final FeedbackResponse data,
    final String? message,
  }) = _$FeedbackApiResponseImpl;
  const _FeedbackApiResponse._() : super._();

  factory _FeedbackApiResponse.fromJson(Map<String, dynamic> json) =
      _$FeedbackApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  FeedbackResponse get data;
  @override
  String? get message;

  /// Create a copy of FeedbackApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackApiResponseImplCopyWith<_$FeedbackApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
