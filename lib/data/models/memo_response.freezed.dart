// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemoResponse _$MemoResponseFromJson(Map<String, dynamic> json) {
  return _MemoResponse.fromJson(json);
}

/// @nodoc
mixin _$MemoResponse {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get artworkId => throw _privateConstructorUsedError;
  int? get docentSessionId => throw _privateConstructorUsedError;
  String? get voiceUrl => throw _privateConstructorUsedError;
  int? get voiceDurationSeconds => throw _privateConstructorUsedError;
  String get inputMethod => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool? get isSharedWithCompanion => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MemoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoResponseCopyWith<MemoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoResponseCopyWith<$Res> {
  factory $MemoResponseCopyWith(
    MemoResponse value,
    $Res Function(MemoResponse) then,
  ) = _$MemoResponseCopyWithImpl<$Res, MemoResponse>;
  @useResult
  $Res call({
    int id,
    int userId,
    String content,
    int? artworkId,
    int? docentSessionId,
    String? voiceUrl,
    int? voiceDurationSeconds,
    String inputMethod,
    List<String>? tags,
    String? category,
    bool? isSharedWithCompanion,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$MemoResponseCopyWithImpl<$Res, $Val extends MemoResponse>
    implements $MemoResponseCopyWith<$Res> {
  _$MemoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? tags = freezed,
    Object? category = freezed,
    Object? isSharedWithCompanion = freezed,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            artworkId: freezed == artworkId
                ? _value.artworkId
                : artworkId // ignore: cast_nullable_to_non_nullable
                      as int?,
            docentSessionId: freezed == docentSessionId
                ? _value.docentSessionId
                : docentSessionId // ignore: cast_nullable_to_non_nullable
                      as int?,
            voiceUrl: freezed == voiceUrl
                ? _value.voiceUrl
                : voiceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            voiceDurationSeconds: freezed == voiceDurationSeconds
                ? _value.voiceDurationSeconds
                : voiceDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            inputMethod: null == inputMethod
                ? _value.inputMethod
                : inputMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSharedWithCompanion: freezed == isSharedWithCompanion
                ? _value.isSharedWithCompanion
                : isSharedWithCompanion // ignore: cast_nullable_to_non_nullable
                      as bool?,
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
abstract class _$$MemoResponseImplCopyWith<$Res>
    implements $MemoResponseCopyWith<$Res> {
  factory _$$MemoResponseImplCopyWith(
    _$MemoResponseImpl value,
    $Res Function(_$MemoResponseImpl) then,
  ) = __$$MemoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    String content,
    int? artworkId,
    int? docentSessionId,
    String? voiceUrl,
    int? voiceDurationSeconds,
    String inputMethod,
    List<String>? tags,
    String? category,
    bool? isSharedWithCompanion,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$MemoResponseImplCopyWithImpl<$Res>
    extends _$MemoResponseCopyWithImpl<$Res, _$MemoResponseImpl>
    implements _$$MemoResponseImplCopyWith<$Res> {
  __$$MemoResponseImplCopyWithImpl(
    _$MemoResponseImpl _value,
    $Res Function(_$MemoResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? tags = freezed,
    Object? category = freezed,
    Object? isSharedWithCompanion = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MemoResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        artworkId: freezed == artworkId
            ? _value.artworkId
            : artworkId // ignore: cast_nullable_to_non_nullable
                  as int?,
        docentSessionId: freezed == docentSessionId
            ? _value.docentSessionId
            : docentSessionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        voiceUrl: freezed == voiceUrl
            ? _value.voiceUrl
            : voiceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        voiceDurationSeconds: freezed == voiceDurationSeconds
            ? _value.voiceDurationSeconds
            : voiceDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        inputMethod: null == inputMethod
            ? _value.inputMethod
            : inputMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSharedWithCompanion: freezed == isSharedWithCompanion
            ? _value.isSharedWithCompanion
            : isSharedWithCompanion // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
class _$MemoResponseImpl extends _MemoResponse {
  const _$MemoResponseImpl({
    required this.id,
    required this.userId,
    required this.content,
    this.artworkId,
    this.docentSessionId,
    this.voiceUrl,
    this.voiceDurationSeconds,
    required this.inputMethod,
    final List<String>? tags,
    this.category,
    this.isSharedWithCompanion,
    required this.createdAt,
    required this.updatedAt,
  }) : _tags = tags,
       super._();

  factory _$MemoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String content;
  @override
  final int? artworkId;
  @override
  final int? docentSessionId;
  @override
  final String? voiceUrl;
  @override
  final int? voiceDurationSeconds;
  @override
  final String inputMethod;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? category;
  @override
  final bool? isSharedWithCompanion;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MemoResponse(id: $id, userId: $userId, content: $content, artworkId: $artworkId, docentSessionId: $docentSessionId, voiceUrl: $voiceUrl, voiceDurationSeconds: $voiceDurationSeconds, inputMethod: $inputMethod, tags: $tags, category: $category, isSharedWithCompanion: $isSharedWithCompanion, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.docentSessionId, docentSessionId) ||
                other.docentSessionId == docentSessionId) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.voiceDurationSeconds, voiceDurationSeconds) ||
                other.voiceDurationSeconds == voiceDurationSeconds) &&
            (identical(other.inputMethod, inputMethod) ||
                other.inputMethod == inputMethod) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isSharedWithCompanion, isSharedWithCompanion) ||
                other.isSharedWithCompanion == isSharedWithCompanion) &&
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
    content,
    artworkId,
    docentSessionId,
    voiceUrl,
    voiceDurationSeconds,
    inputMethod,
    const DeepCollectionEquality().hash(_tags),
    category,
    isSharedWithCompanion,
    createdAt,
    updatedAt,
  );

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoResponseImplCopyWith<_$MemoResponseImpl> get copyWith =>
      __$$MemoResponseImplCopyWithImpl<_$MemoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoResponseImplToJson(this);
  }
}

abstract class _MemoResponse extends MemoResponse {
  const factory _MemoResponse({
    required final int id,
    required final int userId,
    required final String content,
    final int? artworkId,
    final int? docentSessionId,
    final String? voiceUrl,
    final int? voiceDurationSeconds,
    required final String inputMethod,
    final List<String>? tags,
    final String? category,
    final bool? isSharedWithCompanion,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$MemoResponseImpl;
  const _MemoResponse._() : super._();

  factory _MemoResponse.fromJson(Map<String, dynamic> json) =
      _$MemoResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get content;
  @override
  int? get artworkId;
  @override
  int? get docentSessionId;
  @override
  String? get voiceUrl;
  @override
  int? get voiceDurationSeconds;
  @override
  String get inputMethod;
  @override
  List<String>? get tags;
  @override
  String? get category;
  @override
  bool? get isSharedWithCompanion;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoResponseImplCopyWith<_$MemoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemoApiResponse _$MemoApiResponseFromJson(Map<String, dynamic> json) {
  return _MemoApiResponse.fromJson(json);
}

/// @nodoc
mixin _$MemoApiResponse {
  bool get success => throw _privateConstructorUsedError;
  MemoResponse get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this MemoApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoApiResponseCopyWith<MemoApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoApiResponseCopyWith<$Res> {
  factory $MemoApiResponseCopyWith(
    MemoApiResponse value,
    $Res Function(MemoApiResponse) then,
  ) = _$MemoApiResponseCopyWithImpl<$Res, MemoApiResponse>;
  @useResult
  $Res call({bool success, MemoResponse data, String? message});

  $MemoResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$MemoApiResponseCopyWithImpl<$Res, $Val extends MemoApiResponse>
    implements $MemoApiResponseCopyWith<$Res> {
  _$MemoApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoApiResponse
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
                      as MemoResponse,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MemoApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoResponseCopyWith<$Res> get data {
    return $MemoResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemoApiResponseImplCopyWith<$Res>
    implements $MemoApiResponseCopyWith<$Res> {
  factory _$$MemoApiResponseImplCopyWith(
    _$MemoApiResponseImpl value,
    $Res Function(_$MemoApiResponseImpl) then,
  ) = __$$MemoApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, MemoResponse data, String? message});

  @override
  $MemoResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$MemoApiResponseImplCopyWithImpl<$Res>
    extends _$MemoApiResponseCopyWithImpl<$Res, _$MemoApiResponseImpl>
    implements _$$MemoApiResponseImplCopyWith<$Res> {
  __$$MemoApiResponseImplCopyWithImpl(
    _$MemoApiResponseImpl _value,
    $Res Function(_$MemoApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(
      _$MemoApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as MemoResponse,
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
class _$MemoApiResponseImpl extends _MemoApiResponse {
  const _$MemoApiResponseImpl({
    required this.success,
    required this.data,
    this.message,
  }) : super._();

  factory _$MemoApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final MemoResponse data;
  @override
  final String? message;

  @override
  String toString() {
    return 'MemoApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of MemoApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoApiResponseImplCopyWith<_$MemoApiResponseImpl> get copyWith =>
      __$$MemoApiResponseImplCopyWithImpl<_$MemoApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoApiResponseImplToJson(this);
  }
}

abstract class _MemoApiResponse extends MemoApiResponse {
  const factory _MemoApiResponse({
    required final bool success,
    required final MemoResponse data,
    final String? message,
  }) = _$MemoApiResponseImpl;
  const _MemoApiResponse._() : super._();

  factory _MemoApiResponse.fromJson(Map<String, dynamic> json) =
      _$MemoApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  MemoResponse get data;
  @override
  String? get message;

  /// Create a copy of MemoApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoApiResponseImplCopyWith<_$MemoApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
