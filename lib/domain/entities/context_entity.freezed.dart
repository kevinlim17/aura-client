// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContextEntity _$ContextEntityFromJson(Map<String, dynamic> json) {
  return _ContextEntity.fromJson(json);
}

/// @nodoc
mixin _$ContextEntity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  ContextType get contextType => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get voiceUrl => throw _privateConstructorUsedError;
  int? get voiceDurationSeconds => throw _privateConstructorUsedError;
  InputMethod get inputMethod => throw _privateConstructorUsedError;
  List<String> get emotionTags => throw _privateConstructorUsedError;
  int get importanceLevel => throw _privateConstructorUsedError;
  bool get isCompanionInput => throw _privateConstructorUsedError;
  int? get companionUserId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ContextEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContextEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContextEntityCopyWith<ContextEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextEntityCopyWith<$Res> {
  factory $ContextEntityCopyWith(
    ContextEntity value,
    $Res Function(ContextEntity) then,
  ) = _$ContextEntityCopyWithImpl<$Res, ContextEntity>;
  @useResult
  $Res call({
    int id,
    int userId,
    ContextType contextType,
    String? title,
    String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    InputMethod inputMethod,
    List<String> emotionTags,
    int importanceLevel,
    bool isCompanionInput,
    int? companionUserId,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ContextEntityCopyWithImpl<$Res, $Val extends ContextEntity>
    implements $ContextEntityCopyWith<$Res> {
  _$ContextEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? contextType = null,
    Object? title = freezed,
    Object? content = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? emotionTags = null,
    Object? importanceLevel = null,
    Object? isCompanionInput = null,
    Object? companionUserId = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
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
            contextType: null == contextType
                ? _value.contextType
                : contextType // ignore: cast_nullable_to_non_nullable
                      as ContextType,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as InputMethod,
            emotionTags: null == emotionTags
                ? _value.emotionTags
                : emotionTags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            importanceLevel: null == importanceLevel
                ? _value.importanceLevel
                : importanceLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompanionInput: null == isCompanionInput
                ? _value.isCompanionInput
                : isCompanionInput // ignore: cast_nullable_to_non_nullable
                      as bool,
            companionUserId: freezed == companionUserId
                ? _value.companionUserId
                : companionUserId // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContextEntityImplCopyWith<$Res>
    implements $ContextEntityCopyWith<$Res> {
  factory _$$ContextEntityImplCopyWith(
    _$ContextEntityImpl value,
    $Res Function(_$ContextEntityImpl) then,
  ) = __$$ContextEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    ContextType contextType,
    String? title,
    String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    InputMethod inputMethod,
    List<String> emotionTags,
    int importanceLevel,
    bool isCompanionInput,
    int? companionUserId,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ContextEntityImplCopyWithImpl<$Res>
    extends _$ContextEntityCopyWithImpl<$Res, _$ContextEntityImpl>
    implements _$$ContextEntityImplCopyWith<$Res> {
  __$$ContextEntityImplCopyWithImpl(
    _$ContextEntityImpl _value,
    $Res Function(_$ContextEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? contextType = null,
    Object? title = freezed,
    Object? content = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? emotionTags = null,
    Object? importanceLevel = null,
    Object? isCompanionInput = null,
    Object? companionUserId = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ContextEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        contextType: null == contextType
            ? _value.contextType
            : contextType // ignore: cast_nullable_to_non_nullable
                  as ContextType,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as InputMethod,
        emotionTags: null == emotionTags
            ? _value._emotionTags
            : emotionTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        importanceLevel: null == importanceLevel
            ? _value.importanceLevel
            : importanceLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompanionInput: null == isCompanionInput
            ? _value.isCompanionInput
            : isCompanionInput // ignore: cast_nullable_to_non_nullable
                  as bool,
        companionUserId: freezed == companionUserId
            ? _value.companionUserId
            : companionUserId // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextEntityImpl implements _ContextEntity {
  const _$ContextEntityImpl({
    required this.id,
    required this.userId,
    required this.contextType,
    this.title,
    required this.content,
    this.voiceUrl,
    this.voiceDurationSeconds,
    required this.inputMethod,
    final List<String> emotionTags = const [],
    this.importanceLevel = 3,
    this.isCompanionInput = false,
    this.companionUserId,
    required this.createdAt,
    this.updatedAt,
  }) : _emotionTags = emotionTags;

  factory _$ContextEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final ContextType contextType;
  @override
  final String? title;
  @override
  final String content;
  @override
  final String? voiceUrl;
  @override
  final int? voiceDurationSeconds;
  @override
  final InputMethod inputMethod;
  final List<String> _emotionTags;
  @override
  @JsonKey()
  List<String> get emotionTags {
    if (_emotionTags is EqualUnmodifiableListView) return _emotionTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotionTags);
  }

  @override
  @JsonKey()
  final int importanceLevel;
  @override
  @JsonKey()
  final bool isCompanionInput;
  @override
  final int? companionUserId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ContextEntity(id: $id, userId: $userId, contextType: $contextType, title: $title, content: $content, voiceUrl: $voiceUrl, voiceDurationSeconds: $voiceDurationSeconds, inputMethod: $inputMethod, emotionTags: $emotionTags, importanceLevel: $importanceLevel, isCompanionInput: $isCompanionInput, companionUserId: $companionUserId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contextType, contextType) ||
                other.contextType == contextType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.voiceDurationSeconds, voiceDurationSeconds) ||
                other.voiceDurationSeconds == voiceDurationSeconds) &&
            (identical(other.inputMethod, inputMethod) ||
                other.inputMethod == inputMethod) &&
            const DeepCollectionEquality().equals(
              other._emotionTags,
              _emotionTags,
            ) &&
            (identical(other.importanceLevel, importanceLevel) ||
                other.importanceLevel == importanceLevel) &&
            (identical(other.isCompanionInput, isCompanionInput) ||
                other.isCompanionInput == isCompanionInput) &&
            (identical(other.companionUserId, companionUserId) ||
                other.companionUserId == companionUserId) &&
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
    contextType,
    title,
    content,
    voiceUrl,
    voiceDurationSeconds,
    inputMethod,
    const DeepCollectionEquality().hash(_emotionTags),
    importanceLevel,
    isCompanionInput,
    companionUserId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ContextEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextEntityImplCopyWith<_$ContextEntityImpl> get copyWith =>
      __$$ContextEntityImplCopyWithImpl<_$ContextEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextEntityImplToJson(this);
  }
}

abstract class _ContextEntity implements ContextEntity {
  const factory _ContextEntity({
    required final int id,
    required final int userId,
    required final ContextType contextType,
    final String? title,
    required final String content,
    final String? voiceUrl,
    final int? voiceDurationSeconds,
    required final InputMethod inputMethod,
    final List<String> emotionTags,
    final int importanceLevel,
    final bool isCompanionInput,
    final int? companionUserId,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$ContextEntityImpl;

  factory _ContextEntity.fromJson(Map<String, dynamic> json) =
      _$ContextEntityImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  ContextType get contextType;
  @override
  String? get title;
  @override
  String get content;
  @override
  String? get voiceUrl;
  @override
  int? get voiceDurationSeconds;
  @override
  InputMethod get inputMethod;
  @override
  List<String> get emotionTags;
  @override
  int get importanceLevel;
  @override
  bool get isCompanionInput;
  @override
  int? get companionUserId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ContextEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextEntityImplCopyWith<_$ContextEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateContextRequest _$CreateContextRequestFromJson(Map<String, dynamic> json) {
  return _CreateContextRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateContextRequest {
  ContextType get contextType => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get voiceUrl => throw _privateConstructorUsedError;
  int? get voiceDurationSeconds => throw _privateConstructorUsedError;
  InputMethod get inputMethod => throw _privateConstructorUsedError;
  List<String> get emotionTags => throw _privateConstructorUsedError;
  int get importanceLevel => throw _privateConstructorUsedError;
  bool get isCompanionInput => throw _privateConstructorUsedError;
  int? get companionUserId => throw _privateConstructorUsedError;

  /// Serializes this CreateContextRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateContextRequestCopyWith<CreateContextRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateContextRequestCopyWith<$Res> {
  factory $CreateContextRequestCopyWith(
    CreateContextRequest value,
    $Res Function(CreateContextRequest) then,
  ) = _$CreateContextRequestCopyWithImpl<$Res, CreateContextRequest>;
  @useResult
  $Res call({
    ContextType contextType,
    String? title,
    String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    InputMethod inputMethod,
    List<String> emotionTags,
    int importanceLevel,
    bool isCompanionInput,
    int? companionUserId,
  });
}

/// @nodoc
class _$CreateContextRequestCopyWithImpl<
  $Res,
  $Val extends CreateContextRequest
>
    implements $CreateContextRequestCopyWith<$Res> {
  _$CreateContextRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contextType = null,
    Object? title = freezed,
    Object? content = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? emotionTags = null,
    Object? importanceLevel = null,
    Object? isCompanionInput = null,
    Object? companionUserId = freezed,
  }) {
    return _then(
      _value.copyWith(
            contextType: null == contextType
                ? _value.contextType
                : contextType // ignore: cast_nullable_to_non_nullable
                      as ContextType,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as InputMethod,
            emotionTags: null == emotionTags
                ? _value.emotionTags
                : emotionTags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            importanceLevel: null == importanceLevel
                ? _value.importanceLevel
                : importanceLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompanionInput: null == isCompanionInput
                ? _value.isCompanionInput
                : isCompanionInput // ignore: cast_nullable_to_non_nullable
                      as bool,
            companionUserId: freezed == companionUserId
                ? _value.companionUserId
                : companionUserId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateContextRequestImplCopyWith<$Res>
    implements $CreateContextRequestCopyWith<$Res> {
  factory _$$CreateContextRequestImplCopyWith(
    _$CreateContextRequestImpl value,
    $Res Function(_$CreateContextRequestImpl) then,
  ) = __$$CreateContextRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ContextType contextType,
    String? title,
    String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    InputMethod inputMethod,
    List<String> emotionTags,
    int importanceLevel,
    bool isCompanionInput,
    int? companionUserId,
  });
}

/// @nodoc
class __$$CreateContextRequestImplCopyWithImpl<$Res>
    extends _$CreateContextRequestCopyWithImpl<$Res, _$CreateContextRequestImpl>
    implements _$$CreateContextRequestImplCopyWith<$Res> {
  __$$CreateContextRequestImplCopyWithImpl(
    _$CreateContextRequestImpl _value,
    $Res Function(_$CreateContextRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contextType = null,
    Object? title = freezed,
    Object? content = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? inputMethod = null,
    Object? emotionTags = null,
    Object? importanceLevel = null,
    Object? isCompanionInput = null,
    Object? companionUserId = freezed,
  }) {
    return _then(
      _$CreateContextRequestImpl(
        contextType: null == contextType
            ? _value.contextType
            : contextType // ignore: cast_nullable_to_non_nullable
                  as ContextType,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as InputMethod,
        emotionTags: null == emotionTags
            ? _value._emotionTags
            : emotionTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        importanceLevel: null == importanceLevel
            ? _value.importanceLevel
            : importanceLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompanionInput: null == isCompanionInput
            ? _value.isCompanionInput
            : isCompanionInput // ignore: cast_nullable_to_non_nullable
                  as bool,
        companionUserId: freezed == companionUserId
            ? _value.companionUserId
            : companionUserId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateContextRequestImpl implements _CreateContextRequest {
  const _$CreateContextRequestImpl({
    required this.contextType,
    this.title,
    required this.content,
    this.voiceUrl,
    this.voiceDurationSeconds,
    required this.inputMethod,
    final List<String> emotionTags = const [],
    this.importanceLevel = 3,
    this.isCompanionInput = false,
    this.companionUserId,
  }) : _emotionTags = emotionTags;

  factory _$CreateContextRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateContextRequestImplFromJson(json);

  @override
  final ContextType contextType;
  @override
  final String? title;
  @override
  final String content;
  @override
  final String? voiceUrl;
  @override
  final int? voiceDurationSeconds;
  @override
  final InputMethod inputMethod;
  final List<String> _emotionTags;
  @override
  @JsonKey()
  List<String> get emotionTags {
    if (_emotionTags is EqualUnmodifiableListView) return _emotionTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotionTags);
  }

  @override
  @JsonKey()
  final int importanceLevel;
  @override
  @JsonKey()
  final bool isCompanionInput;
  @override
  final int? companionUserId;

  @override
  String toString() {
    return 'CreateContextRequest(contextType: $contextType, title: $title, content: $content, voiceUrl: $voiceUrl, voiceDurationSeconds: $voiceDurationSeconds, inputMethod: $inputMethod, emotionTags: $emotionTags, importanceLevel: $importanceLevel, isCompanionInput: $isCompanionInput, companionUserId: $companionUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateContextRequestImpl &&
            (identical(other.contextType, contextType) ||
                other.contextType == contextType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.voiceDurationSeconds, voiceDurationSeconds) ||
                other.voiceDurationSeconds == voiceDurationSeconds) &&
            (identical(other.inputMethod, inputMethod) ||
                other.inputMethod == inputMethod) &&
            const DeepCollectionEquality().equals(
              other._emotionTags,
              _emotionTags,
            ) &&
            (identical(other.importanceLevel, importanceLevel) ||
                other.importanceLevel == importanceLevel) &&
            (identical(other.isCompanionInput, isCompanionInput) ||
                other.isCompanionInput == isCompanionInput) &&
            (identical(other.companionUserId, companionUserId) ||
                other.companionUserId == companionUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contextType,
    title,
    content,
    voiceUrl,
    voiceDurationSeconds,
    inputMethod,
    const DeepCollectionEquality().hash(_emotionTags),
    importanceLevel,
    isCompanionInput,
    companionUserId,
  );

  /// Create a copy of CreateContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateContextRequestImplCopyWith<_$CreateContextRequestImpl>
  get copyWith =>
      __$$CreateContextRequestImplCopyWithImpl<_$CreateContextRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateContextRequestImplToJson(this);
  }
}

abstract class _CreateContextRequest implements CreateContextRequest {
  const factory _CreateContextRequest({
    required final ContextType contextType,
    final String? title,
    required final String content,
    final String? voiceUrl,
    final int? voiceDurationSeconds,
    required final InputMethod inputMethod,
    final List<String> emotionTags,
    final int importanceLevel,
    final bool isCompanionInput,
    final int? companionUserId,
  }) = _$CreateContextRequestImpl;

  factory _CreateContextRequest.fromJson(Map<String, dynamic> json) =
      _$CreateContextRequestImpl.fromJson;

  @override
  ContextType get contextType;
  @override
  String? get title;
  @override
  String get content;
  @override
  String? get voiceUrl;
  @override
  int? get voiceDurationSeconds;
  @override
  InputMethod get inputMethod;
  @override
  List<String> get emotionTags;
  @override
  int get importanceLevel;
  @override
  bool get isCompanionInput;
  @override
  int? get companionUserId;

  /// Create a copy of CreateContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateContextRequestImplCopyWith<_$CreateContextRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
