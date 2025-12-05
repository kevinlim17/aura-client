// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemoEntity _$MemoEntityFromJson(Map<String, dynamic> json) {
  return _MemoEntity.fromJson(json);
}

/// @nodoc
mixin _$MemoEntity {
  String get content => throw _privateConstructorUsedError;
  InputMethod get inputMethod => throw _privateConstructorUsedError;
  String? get voiceUrl => throw _privateConstructorUsedError;
  int? get voiceDurationSeconds => throw _privateConstructorUsedError;
  MemoCategory? get category => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  int? get artworkId => throw _privateConstructorUsedError;
  int? get docentSessionId => throw _privateConstructorUsedError;
  bool? get isSharedWithCompanion => throw _privateConstructorUsedError;

  /// Serializes this MemoEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoEntityCopyWith<MemoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoEntityCopyWith<$Res> {
  factory $MemoEntityCopyWith(
    MemoEntity value,
    $Res Function(MemoEntity) then,
  ) = _$MemoEntityCopyWithImpl<$Res, MemoEntity>;
  @useResult
  $Res call({
    String content,
    InputMethod inputMethod,
    String? voiceUrl,
    int? voiceDurationSeconds,
    MemoCategory? category,
    List<String>? tags,
    int? artworkId,
    int? docentSessionId,
    bool? isSharedWithCompanion,
  });
}

/// @nodoc
class _$MemoEntityCopyWithImpl<$Res, $Val extends MemoEntity>
    implements $MemoEntityCopyWith<$Res> {
  _$MemoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? inputMethod = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? isSharedWithCompanion = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            inputMethod: null == inputMethod
                ? _value.inputMethod
                : inputMethod // ignore: cast_nullable_to_non_nullable
                      as InputMethod,
            voiceUrl: freezed == voiceUrl
                ? _value.voiceUrl
                : voiceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            voiceDurationSeconds: freezed == voiceDurationSeconds
                ? _value.voiceDurationSeconds
                : voiceDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as MemoCategory?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            artworkId: freezed == artworkId
                ? _value.artworkId
                : artworkId // ignore: cast_nullable_to_non_nullable
                      as int?,
            docentSessionId: freezed == docentSessionId
                ? _value.docentSessionId
                : docentSessionId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isSharedWithCompanion: freezed == isSharedWithCompanion
                ? _value.isSharedWithCompanion
                : isSharedWithCompanion // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemoEntityImplCopyWith<$Res>
    implements $MemoEntityCopyWith<$Res> {
  factory _$$MemoEntityImplCopyWith(
    _$MemoEntityImpl value,
    $Res Function(_$MemoEntityImpl) then,
  ) = __$$MemoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    InputMethod inputMethod,
    String? voiceUrl,
    int? voiceDurationSeconds,
    MemoCategory? category,
    List<String>? tags,
    int? artworkId,
    int? docentSessionId,
    bool? isSharedWithCompanion,
  });
}

/// @nodoc
class __$$MemoEntityImplCopyWithImpl<$Res>
    extends _$MemoEntityCopyWithImpl<$Res, _$MemoEntityImpl>
    implements _$$MemoEntityImplCopyWith<$Res> {
  __$$MemoEntityImplCopyWithImpl(
    _$MemoEntityImpl _value,
    $Res Function(_$MemoEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? inputMethod = null,
    Object? voiceUrl = freezed,
    Object? voiceDurationSeconds = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? artworkId = freezed,
    Object? docentSessionId = freezed,
    Object? isSharedWithCompanion = freezed,
  }) {
    return _then(
      _$MemoEntityImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        inputMethod: null == inputMethod
            ? _value.inputMethod
            : inputMethod // ignore: cast_nullable_to_non_nullable
                  as InputMethod,
        voiceUrl: freezed == voiceUrl
            ? _value.voiceUrl
            : voiceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        voiceDurationSeconds: freezed == voiceDurationSeconds
            ? _value.voiceDurationSeconds
            : voiceDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as MemoCategory?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        artworkId: freezed == artworkId
            ? _value.artworkId
            : artworkId // ignore: cast_nullable_to_non_nullable
                  as int?,
        docentSessionId: freezed == docentSessionId
            ? _value.docentSessionId
            : docentSessionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isSharedWithCompanion: freezed == isSharedWithCompanion
            ? _value.isSharedWithCompanion
            : isSharedWithCompanion // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoEntityImpl implements _MemoEntity {
  const _$MemoEntityImpl({
    required this.content,
    required this.inputMethod,
    this.voiceUrl,
    this.voiceDurationSeconds,
    this.category,
    final List<String>? tags,
    this.artworkId,
    this.docentSessionId,
    this.isSharedWithCompanion,
  }) : _tags = tags;

  factory _$MemoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoEntityImplFromJson(json);

  @override
  final String content;
  @override
  final InputMethod inputMethod;
  @override
  final String? voiceUrl;
  @override
  final int? voiceDurationSeconds;
  @override
  final MemoCategory? category;
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
  final int? artworkId;
  @override
  final int? docentSessionId;
  @override
  final bool? isSharedWithCompanion;

  @override
  String toString() {
    return 'MemoEntity(content: $content, inputMethod: $inputMethod, voiceUrl: $voiceUrl, voiceDurationSeconds: $voiceDurationSeconds, category: $category, tags: $tags, artworkId: $artworkId, docentSessionId: $docentSessionId, isSharedWithCompanion: $isSharedWithCompanion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoEntityImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.inputMethod, inputMethod) ||
                other.inputMethod == inputMethod) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.voiceDurationSeconds, voiceDurationSeconds) ||
                other.voiceDurationSeconds == voiceDurationSeconds) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.docentSessionId, docentSessionId) ||
                other.docentSessionId == docentSessionId) &&
            (identical(other.isSharedWithCompanion, isSharedWithCompanion) ||
                other.isSharedWithCompanion == isSharedWithCompanion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    inputMethod,
    voiceUrl,
    voiceDurationSeconds,
    category,
    const DeepCollectionEquality().hash(_tags),
    artworkId,
    docentSessionId,
    isSharedWithCompanion,
  );

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoEntityImplCopyWith<_$MemoEntityImpl> get copyWith =>
      __$$MemoEntityImplCopyWithImpl<_$MemoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoEntityImplToJson(this);
  }
}

abstract class _MemoEntity implements MemoEntity {
  const factory _MemoEntity({
    required final String content,
    required final InputMethod inputMethod,
    final String? voiceUrl,
    final int? voiceDurationSeconds,
    final MemoCategory? category,
    final List<String>? tags,
    final int? artworkId,
    final int? docentSessionId,
    final bool? isSharedWithCompanion,
  }) = _$MemoEntityImpl;

  factory _MemoEntity.fromJson(Map<String, dynamic> json) =
      _$MemoEntityImpl.fromJson;

  @override
  String get content;
  @override
  InputMethod get inputMethod;
  @override
  String? get voiceUrl;
  @override
  int? get voiceDurationSeconds;
  @override
  MemoCategory? get category;
  @override
  List<String>? get tags;
  @override
  int? get artworkId;
  @override
  int? get docentSessionId;
  @override
  bool? get isSharedWithCompanion;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoEntityImplCopyWith<_$MemoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
