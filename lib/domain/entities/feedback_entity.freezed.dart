// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImprovementSuggestions _$ImprovementSuggestionsFromJson(
  Map<String, dynamic> json,
) {
  return _ImprovementSuggestions.fromJson(json);
}

/// @nodoc
mixin _$ImprovementSuggestions {
  String? get length => throw _privateConstructorUsedError;
  String? get style => throw _privateConstructorUsedError;

  /// Serializes this ImprovementSuggestions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImprovementSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImprovementSuggestionsCopyWith<ImprovementSuggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprovementSuggestionsCopyWith<$Res> {
  factory $ImprovementSuggestionsCopyWith(
    ImprovementSuggestions value,
    $Res Function(ImprovementSuggestions) then,
  ) = _$ImprovementSuggestionsCopyWithImpl<$Res, ImprovementSuggestions>;
  @useResult
  $Res call({String? length, String? style});
}

/// @nodoc
class _$ImprovementSuggestionsCopyWithImpl<
  $Res,
  $Val extends ImprovementSuggestions
>
    implements $ImprovementSuggestionsCopyWith<$Res> {
  _$ImprovementSuggestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImprovementSuggestions
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
abstract class _$$ImprovementSuggestionsImplCopyWith<$Res>
    implements $ImprovementSuggestionsCopyWith<$Res> {
  factory _$$ImprovementSuggestionsImplCopyWith(
    _$ImprovementSuggestionsImpl value,
    $Res Function(_$ImprovementSuggestionsImpl) then,
  ) = __$$ImprovementSuggestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? length, String? style});
}

/// @nodoc
class __$$ImprovementSuggestionsImplCopyWithImpl<$Res>
    extends
        _$ImprovementSuggestionsCopyWithImpl<$Res, _$ImprovementSuggestionsImpl>
    implements _$$ImprovementSuggestionsImplCopyWith<$Res> {
  __$$ImprovementSuggestionsImplCopyWithImpl(
    _$ImprovementSuggestionsImpl _value,
    $Res Function(_$ImprovementSuggestionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImprovementSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? length = freezed, Object? style = freezed}) {
    return _then(
      _$ImprovementSuggestionsImpl(
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
class _$ImprovementSuggestionsImpl implements _ImprovementSuggestions {
  const _$ImprovementSuggestionsImpl({this.length, this.style});

  factory _$ImprovementSuggestionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImprovementSuggestionsImplFromJson(json);

  @override
  final String? length;
  @override
  final String? style;

  @override
  String toString() {
    return 'ImprovementSuggestions(length: $length, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImprovementSuggestionsImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, length, style);

  /// Create a copy of ImprovementSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImprovementSuggestionsImplCopyWith<_$ImprovementSuggestionsImpl>
  get copyWith =>
      __$$ImprovementSuggestionsImplCopyWithImpl<_$ImprovementSuggestionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImprovementSuggestionsImplToJson(this);
  }
}

abstract class _ImprovementSuggestions implements ImprovementSuggestions {
  const factory _ImprovementSuggestions({
    final String? length,
    final String? style,
  }) = _$ImprovementSuggestionsImpl;

  factory _ImprovementSuggestions.fromJson(Map<String, dynamic> json) =
      _$ImprovementSuggestionsImpl.fromJson;

  @override
  String? get length;
  @override
  String? get style;

  /// Create a copy of ImprovementSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImprovementSuggestionsImplCopyWith<_$ImprovementSuggestionsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FeedbackSubmissionRequest _$FeedbackSubmissionRequestFromJson(
  Map<String, dynamic> json,
) {
  return _FeedbackSubmissionRequest.fromJson(json);
}

/// @nodoc
mixin _$FeedbackSubmissionRequest {
  int get emotionalResonance => throw _privateConstructorUsedError;
  int? get imaginativeEngagement => throw _privateConstructorUsedError;
  int? get emotionalImpact => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ImprovementSuggestions? get improvementSuggestions =>
      throw _privateConstructorUsedError;

  /// Serializes this FeedbackSubmissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackSubmissionRequestCopyWith<FeedbackSubmissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackSubmissionRequestCopyWith<$Res> {
  factory $FeedbackSubmissionRequestCopyWith(
    FeedbackSubmissionRequest value,
    $Res Function(FeedbackSubmissionRequest) then,
  ) = _$FeedbackSubmissionRequestCopyWithImpl<$Res, FeedbackSubmissionRequest>;
  @useResult
  $Res call({
    int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    String? comment,
    ImprovementSuggestions? improvementSuggestions,
  });

  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class _$FeedbackSubmissionRequestCopyWithImpl<
  $Res,
  $Val extends FeedbackSubmissionRequest
>
    implements $FeedbackSubmissionRequestCopyWith<$Res> {
  _$FeedbackSubmissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionalResonance = null,
    Object? imaginativeEngagement = freezed,
    Object? emotionalImpact = freezed,
    Object? comment = freezed,
    Object? improvementSuggestions = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            improvementSuggestions: freezed == improvementSuggestions
                ? _value.improvementSuggestions
                : improvementSuggestions // ignore: cast_nullable_to_non_nullable
                      as ImprovementSuggestions?,
          )
          as $Val,
    );
  }

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions {
    if (_value.improvementSuggestions == null) {
      return null;
    }

    return $ImprovementSuggestionsCopyWith<$Res>(
      _value.improvementSuggestions!,
      (value) {
        return _then(_value.copyWith(improvementSuggestions: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$FeedbackSubmissionRequestImplCopyWith<$Res>
    implements $FeedbackSubmissionRequestCopyWith<$Res> {
  factory _$$FeedbackSubmissionRequestImplCopyWith(
    _$FeedbackSubmissionRequestImpl value,
    $Res Function(_$FeedbackSubmissionRequestImpl) then,
  ) = __$$FeedbackSubmissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    String? comment,
    ImprovementSuggestions? improvementSuggestions,
  });

  @override
  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class __$$FeedbackSubmissionRequestImplCopyWithImpl<$Res>
    extends
        _$FeedbackSubmissionRequestCopyWithImpl<
          $Res,
          _$FeedbackSubmissionRequestImpl
        >
    implements _$$FeedbackSubmissionRequestImplCopyWith<$Res> {
  __$$FeedbackSubmissionRequestImplCopyWithImpl(
    _$FeedbackSubmissionRequestImpl _value,
    $Res Function(_$FeedbackSubmissionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionalResonance = null,
    Object? imaginativeEngagement = freezed,
    Object? emotionalImpact = freezed,
    Object? comment = freezed,
    Object? improvementSuggestions = freezed,
  }) {
    return _then(
      _$FeedbackSubmissionRequestImpl(
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
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        improvementSuggestions: freezed == improvementSuggestions
            ? _value.improvementSuggestions
            : improvementSuggestions // ignore: cast_nullable_to_non_nullable
                  as ImprovementSuggestions?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackSubmissionRequestImpl extends _FeedbackSubmissionRequest {
  const _$FeedbackSubmissionRequestImpl({
    required this.emotionalResonance,
    this.imaginativeEngagement,
    this.emotionalImpact,
    this.comment,
    this.improvementSuggestions,
  }) : super._();

  factory _$FeedbackSubmissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackSubmissionRequestImplFromJson(json);

  @override
  final int emotionalResonance;
  @override
  final int? imaginativeEngagement;
  @override
  final int? emotionalImpact;
  @override
  final String? comment;
  @override
  final ImprovementSuggestions? improvementSuggestions;

  @override
  String toString() {
    return 'FeedbackSubmissionRequest(emotionalResonance: $emotionalResonance, imaginativeEngagement: $imaginativeEngagement, emotionalImpact: $emotionalImpact, comment: $comment, improvementSuggestions: $improvementSuggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackSubmissionRequestImpl &&
            (identical(other.emotionalResonance, emotionalResonance) ||
                other.emotionalResonance == emotionalResonance) &&
            (identical(other.imaginativeEngagement, imaginativeEngagement) ||
                other.imaginativeEngagement == imaginativeEngagement) &&
            (identical(other.emotionalImpact, emotionalImpact) ||
                other.emotionalImpact == emotionalImpact) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.improvementSuggestions, improvementSuggestions) ||
                other.improvementSuggestions == improvementSuggestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    emotionalResonance,
    imaginativeEngagement,
    emotionalImpact,
    comment,
    improvementSuggestions,
  );

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackSubmissionRequestImplCopyWith<_$FeedbackSubmissionRequestImpl>
  get copyWith =>
      __$$FeedbackSubmissionRequestImplCopyWithImpl<
        _$FeedbackSubmissionRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackSubmissionRequestImplToJson(this);
  }
}

abstract class _FeedbackSubmissionRequest extends FeedbackSubmissionRequest {
  const factory _FeedbackSubmissionRequest({
    required final int emotionalResonance,
    final int? imaginativeEngagement,
    final int? emotionalImpact,
    final String? comment,
    final ImprovementSuggestions? improvementSuggestions,
  }) = _$FeedbackSubmissionRequestImpl;
  const _FeedbackSubmissionRequest._() : super._();

  factory _FeedbackSubmissionRequest.fromJson(Map<String, dynamic> json) =
      _$FeedbackSubmissionRequestImpl.fromJson;

  @override
  int get emotionalResonance;
  @override
  int? get imaginativeEngagement;
  @override
  int? get emotionalImpact;
  @override
  String? get comment;
  @override
  ImprovementSuggestions? get improvementSuggestions;

  /// Create a copy of FeedbackSubmissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackSubmissionRequestImplCopyWith<_$FeedbackSubmissionRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FeedbackEntity _$FeedbackEntityFromJson(Map<String, dynamic> json) {
  return _FeedbackEntity.fromJson(json);
}

/// @nodoc
mixin _$FeedbackEntity {
  int get id => throw _privateConstructorUsedError;
  int get docentSessionId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get emotionalResonance => throw _privateConstructorUsedError;
  int? get imaginativeEngagement => throw _privateConstructorUsedError;
  int? get emotionalImpact => throw _privateConstructorUsedError;
  double get overallSatisfaction => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ImprovementSuggestions? get improvementSuggestions =>
      throw _privateConstructorUsedError;
  bool get isFewShotCandidate => throw _privateConstructorUsedError;
  DateTime? get fewShotSelectedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedbackEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackEntityCopyWith<FeedbackEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackEntityCopyWith<$Res> {
  factory $FeedbackEntityCopyWith(
    FeedbackEntity value,
    $Res Function(FeedbackEntity) then,
  ) = _$FeedbackEntityCopyWithImpl<$Res, FeedbackEntity>;
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
    ImprovementSuggestions? improvementSuggestions,
    bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    DateTime createdAt,
  });

  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class _$FeedbackEntityCopyWithImpl<$Res, $Val extends FeedbackEntity>
    implements $FeedbackEntityCopyWith<$Res> {
  _$FeedbackEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackEntity
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
                      as ImprovementSuggestions?,
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

  /// Create a copy of FeedbackEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions {
    if (_value.improvementSuggestions == null) {
      return null;
    }

    return $ImprovementSuggestionsCopyWith<$Res>(
      _value.improvementSuggestions!,
      (value) {
        return _then(_value.copyWith(improvementSuggestions: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$FeedbackEntityImplCopyWith<$Res>
    implements $FeedbackEntityCopyWith<$Res> {
  factory _$$FeedbackEntityImplCopyWith(
    _$FeedbackEntityImpl value,
    $Res Function(_$FeedbackEntityImpl) then,
  ) = __$$FeedbackEntityImplCopyWithImpl<$Res>;
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
    ImprovementSuggestions? improvementSuggestions,
    bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    DateTime createdAt,
  });

  @override
  $ImprovementSuggestionsCopyWith<$Res>? get improvementSuggestions;
}

/// @nodoc
class __$$FeedbackEntityImplCopyWithImpl<$Res>
    extends _$FeedbackEntityCopyWithImpl<$Res, _$FeedbackEntityImpl>
    implements _$$FeedbackEntityImplCopyWith<$Res> {
  __$$FeedbackEntityImplCopyWithImpl(
    _$FeedbackEntityImpl _value,
    $Res Function(_$FeedbackEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackEntity
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
      _$FeedbackEntityImpl(
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
                  as ImprovementSuggestions?,
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
class _$FeedbackEntityImpl implements _FeedbackEntity {
  const _$FeedbackEntityImpl({
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
  });

  factory _$FeedbackEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackEntityImplFromJson(json);

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
  final ImprovementSuggestions? improvementSuggestions;
  @override
  final bool isFewShotCandidate;
  @override
  final DateTime? fewShotSelectedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'FeedbackEntity(id: $id, docentSessionId: $docentSessionId, userId: $userId, emotionalResonance: $emotionalResonance, imaginativeEngagement: $imaginativeEngagement, emotionalImpact: $emotionalImpact, overallSatisfaction: $overallSatisfaction, comment: $comment, improvementSuggestions: $improvementSuggestions, isFewShotCandidate: $isFewShotCandidate, fewShotSelectedAt: $fewShotSelectedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackEntityImpl &&
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

  /// Create a copy of FeedbackEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackEntityImplCopyWith<_$FeedbackEntityImpl> get copyWith =>
      __$$FeedbackEntityImplCopyWithImpl<_$FeedbackEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackEntityImplToJson(this);
  }
}

abstract class _FeedbackEntity implements FeedbackEntity {
  const factory _FeedbackEntity({
    required final int id,
    required final int docentSessionId,
    required final int userId,
    required final int emotionalResonance,
    final int? imaginativeEngagement,
    final int? emotionalImpact,
    required final double overallSatisfaction,
    final String? comment,
    final ImprovementSuggestions? improvementSuggestions,
    required final bool isFewShotCandidate,
    final DateTime? fewShotSelectedAt,
    required final DateTime createdAt,
  }) = _$FeedbackEntityImpl;

  factory _FeedbackEntity.fromJson(Map<String, dynamic> json) =
      _$FeedbackEntityImpl.fromJson;

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
  ImprovementSuggestions? get improvementSuggestions;
  @override
  bool get isFewShotCandidate;
  @override
  DateTime? get fewShotSelectedAt;
  @override
  DateTime get createdAt;

  /// Create a copy of FeedbackEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackEntityImplCopyWith<_$FeedbackEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
