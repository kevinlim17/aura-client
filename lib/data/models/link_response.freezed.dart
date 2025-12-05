// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LinkResponse _$LinkResponseFromJson(Map<String, dynamic> json) {
  return _LinkResponse.fromJson(json);
}

/// @nodoc
mixin _$LinkResponse {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get artworkId => throw _privateConstructorUsedError;
  int? get docentSessionId => throw _privateConstructorUsedError;
  String? get linkType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  bool? get hasAudioDescription => throw _privateConstructorUsedError;
  bool? get hasSubtitles => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LinkResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkResponseCopyWith<LinkResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkResponseCopyWith<$Res> {
  factory $LinkResponseCopyWith(
    LinkResponse value,
    $Res Function(LinkResponse) then,
  ) = _$LinkResponseCopyWithImpl<$Res, LinkResponse>;
  @useResult
  $Res call({
    int id,
    int userId,
    String url,
    String? title,
    String? description,
    int? artworkId,
    int? docentSessionId,
    String? linkType,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
    DateTime createdAt,
  });
}

/// @nodoc
class _$LinkResponseCopyWithImpl<$Res, $Val extends LinkResponse>
    implements $LinkResponseCopyWith<$Res> {
  _$LinkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? url = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? linkType = freezed,
    Object? metadata = freezed,
    Object? thumbnailUrl = freezed,
    Object? hasAudioDescription = freezed,
    Object? hasSubtitles = freezed,
    Object? createdAt = null,
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
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            artworkId: freezed == artworkId
                ? _value.artworkId
                : artworkId // ignore: cast_nullable_to_non_nullable
                      as int?,
            docentSessionId: freezed == docentSessionId
                ? _value.docentSessionId
                : docentSessionId // ignore: cast_nullable_to_non_nullable
                      as int?,
            linkType: freezed == linkType
                ? _value.linkType
                : linkType // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasAudioDescription: freezed == hasAudioDescription
                ? _value.hasAudioDescription
                : hasAudioDescription // ignore: cast_nullable_to_non_nullable
                      as bool?,
            hasSubtitles: freezed == hasSubtitles
                ? _value.hasSubtitles
                : hasSubtitles // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LinkResponseImplCopyWith<$Res>
    implements $LinkResponseCopyWith<$Res> {
  factory _$$LinkResponseImplCopyWith(
    _$LinkResponseImpl value,
    $Res Function(_$LinkResponseImpl) then,
  ) = __$$LinkResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    String url,
    String? title,
    String? description,
    int? artworkId,
    int? docentSessionId,
    String? linkType,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$LinkResponseImplCopyWithImpl<$Res>
    extends _$LinkResponseCopyWithImpl<$Res, _$LinkResponseImpl>
    implements _$$LinkResponseImplCopyWith<$Res> {
  __$$LinkResponseImplCopyWithImpl(
    _$LinkResponseImpl _value,
    $Res Function(_$LinkResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? url = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? linkType = freezed,
    Object? metadata = freezed,
    Object? thumbnailUrl = freezed,
    Object? hasAudioDescription = freezed,
    Object? hasSubtitles = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$LinkResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        artworkId: freezed == artworkId
            ? _value.artworkId
            : artworkId // ignore: cast_nullable_to_non_nullable
                  as int?,
        docentSessionId: freezed == docentSessionId
            ? _value.docentSessionId
            : docentSessionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        linkType: freezed == linkType
            ? _value.linkType
            : linkType // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasAudioDescription: freezed == hasAudioDescription
            ? _value.hasAudioDescription
            : hasAudioDescription // ignore: cast_nullable_to_non_nullable
                  as bool?,
        hasSubtitles: freezed == hasSubtitles
            ? _value.hasSubtitles
            : hasSubtitles // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
class _$LinkResponseImpl extends _LinkResponse {
  const _$LinkResponseImpl({
    required this.id,
    required this.userId,
    required this.url,
    this.title,
    this.description,
    this.artworkId,
    this.docentSessionId,
    this.linkType,
    final Map<String, dynamic>? metadata,
    this.thumbnailUrl,
    this.hasAudioDescription,
    this.hasSubtitles,
    required this.createdAt,
  }) : _metadata = metadata,
       super._();

  factory _$LinkResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String url;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? artworkId;
  @override
  final int? docentSessionId;
  @override
  final String? linkType;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? thumbnailUrl;
  @override
  final bool? hasAudioDescription;
  @override
  final bool? hasSubtitles;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'LinkResponse(id: $id, userId: $userId, url: $url, title: $title, description: $description, artworkId: $artworkId, docentSessionId: $docentSessionId, linkType: $linkType, metadata: $metadata, thumbnailUrl: $thumbnailUrl, hasAudioDescription: $hasAudioDescription, hasSubtitles: $hasSubtitles, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.docentSessionId, docentSessionId) ||
                other.docentSessionId == docentSessionId) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.hasAudioDescription, hasAudioDescription) ||
                other.hasAudioDescription == hasAudioDescription) &&
            (identical(other.hasSubtitles, hasSubtitles) ||
                other.hasSubtitles == hasSubtitles) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    url,
    title,
    description,
    artworkId,
    docentSessionId,
    linkType,
    const DeepCollectionEquality().hash(_metadata),
    thumbnailUrl,
    hasAudioDescription,
    hasSubtitles,
    createdAt,
  );

  /// Create a copy of LinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkResponseImplCopyWith<_$LinkResponseImpl> get copyWith =>
      __$$LinkResponseImplCopyWithImpl<_$LinkResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkResponseImplToJson(this);
  }
}

abstract class _LinkResponse extends LinkResponse {
  const factory _LinkResponse({
    required final int id,
    required final int userId,
    required final String url,
    final String? title,
    final String? description,
    final int? artworkId,
    final int? docentSessionId,
    final String? linkType,
    final Map<String, dynamic>? metadata,
    final String? thumbnailUrl,
    final bool? hasAudioDescription,
    final bool? hasSubtitles,
    required final DateTime createdAt,
  }) = _$LinkResponseImpl;
  const _LinkResponse._() : super._();

  factory _LinkResponse.fromJson(Map<String, dynamic> json) =
      _$LinkResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get url;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get artworkId;
  @override
  int? get docentSessionId;
  @override
  String? get linkType;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get thumbnailUrl;
  @override
  bool? get hasAudioDescription;
  @override
  bool? get hasSubtitles;
  @override
  DateTime get createdAt;

  /// Create a copy of LinkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkResponseImplCopyWith<_$LinkResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkApiResponse _$LinkApiResponseFromJson(Map<String, dynamic> json) {
  return _LinkApiResponse.fromJson(json);
}

/// @nodoc
mixin _$LinkApiResponse {
  bool get success => throw _privateConstructorUsedError;
  LinkResponse get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this LinkApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkApiResponseCopyWith<LinkApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkApiResponseCopyWith<$Res> {
  factory $LinkApiResponseCopyWith(
    LinkApiResponse value,
    $Res Function(LinkApiResponse) then,
  ) = _$LinkApiResponseCopyWithImpl<$Res, LinkApiResponse>;
  @useResult
  $Res call({bool success, LinkResponse data, String? message});

  $LinkResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$LinkApiResponseCopyWithImpl<$Res, $Val extends LinkApiResponse>
    implements $LinkApiResponseCopyWith<$Res> {
  _$LinkApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkApiResponse
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
                      as LinkResponse,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of LinkApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinkResponseCopyWith<$Res> get data {
    return $LinkResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LinkApiResponseImplCopyWith<$Res>
    implements $LinkApiResponseCopyWith<$Res> {
  factory _$$LinkApiResponseImplCopyWith(
    _$LinkApiResponseImpl value,
    $Res Function(_$LinkApiResponseImpl) then,
  ) = __$$LinkApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, LinkResponse data, String? message});

  @override
  $LinkResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$LinkApiResponseImplCopyWithImpl<$Res>
    extends _$LinkApiResponseCopyWithImpl<$Res, _$LinkApiResponseImpl>
    implements _$$LinkApiResponseImplCopyWith<$Res> {
  __$$LinkApiResponseImplCopyWithImpl(
    _$LinkApiResponseImpl _value,
    $Res Function(_$LinkApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LinkApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(
      _$LinkApiResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as LinkResponse,
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
class _$LinkApiResponseImpl extends _LinkApiResponse {
  const _$LinkApiResponseImpl({
    required this.success,
    required this.data,
    this.message,
  }) : super._();

  factory _$LinkApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkApiResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final LinkResponse data;
  @override
  final String? message;

  @override
  String toString() {
    return 'LinkApiResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of LinkApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkApiResponseImplCopyWith<_$LinkApiResponseImpl> get copyWith =>
      __$$LinkApiResponseImplCopyWithImpl<_$LinkApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkApiResponseImplToJson(this);
  }
}

abstract class _LinkApiResponse extends LinkApiResponse {
  const factory _LinkApiResponse({
    required final bool success,
    required final LinkResponse data,
    final String? message,
  }) = _$LinkApiResponseImpl;
  const _LinkApiResponse._() : super._();

  factory _LinkApiResponse.fromJson(Map<String, dynamic> json) =
      _$LinkApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  LinkResponse get data;
  @override
  String? get message;

  /// Create a copy of LinkApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkApiResponseImplCopyWith<_$LinkApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
