// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) {
  return _ProfileEntity.fromJson(json);
}

/// @nodoc
mixin _$ProfileEntity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  List<String> get interests => throw _privateConstructorUsedError;
  String get hobbies => throw _privateConstructorUsedError;
  String? get hobbiesVoiceUrl => throw _privateConstructorUsedError;
  List<String> get favoriteArtists => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProfileEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
    ProfileEntity value,
    $Res Function(ProfileEntity) then,
  ) = _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call({
    int id,
    int userId,
    List<String> interests,
    String hobbies,
    String? hobbiesVoiceUrl,
    List<String> favoriteArtists,
    String bio,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? interests = null,
    Object? hobbies = null,
    Object? hobbiesVoiceUrl = freezed,
    Object? favoriteArtists = null,
    Object? bio = null,
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
            interests: null == interests
                ? _value.interests
                : interests // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hobbies: null == hobbies
                ? _value.hobbies
                : hobbies // ignore: cast_nullable_to_non_nullable
                      as String,
            hobbiesVoiceUrl: freezed == hobbiesVoiceUrl
                ? _value.hobbiesVoiceUrl
                : hobbiesVoiceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            favoriteArtists: null == favoriteArtists
                ? _value.favoriteArtists
                : favoriteArtists // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
    _$ProfileEntityImpl value,
    $Res Function(_$ProfileEntityImpl) then,
  ) = __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    List<String> interests,
    String hobbies,
    String? hobbiesVoiceUrl,
    List<String> favoriteArtists,
    String bio,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
    _$ProfileEntityImpl _value,
    $Res Function(_$ProfileEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? interests = null,
    Object? hobbies = null,
    Object? hobbiesVoiceUrl = freezed,
    Object? favoriteArtists = null,
    Object? bio = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ProfileEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        interests: null == interests
            ? _value._interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hobbies: null == hobbies
            ? _value.hobbies
            : hobbies // ignore: cast_nullable_to_non_nullable
                  as String,
        hobbiesVoiceUrl: freezed == hobbiesVoiceUrl
            ? _value.hobbiesVoiceUrl
            : hobbiesVoiceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteArtists: null == favoriteArtists
            ? _value._favoriteArtists
            : favoriteArtists // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$ProfileEntityImpl implements _ProfileEntity {
  const _$ProfileEntityImpl({
    required this.id,
    required this.userId,
    required final List<String> interests,
    required this.hobbies,
    this.hobbiesVoiceUrl,
    required final List<String> favoriteArtists,
    required this.bio,
    required this.createdAt,
    required this.updatedAt,
  }) : _interests = interests,
       _favoriteArtists = favoriteArtists;

  factory _$ProfileEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  final List<String> _interests;
  @override
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  final String hobbies;
  @override
  final String? hobbiesVoiceUrl;
  final List<String> _favoriteArtists;
  @override
  List<String> get favoriteArtists {
    if (_favoriteArtists is EqualUnmodifiableListView) return _favoriteArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteArtists);
  }

  @override
  final String bio;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProfileEntity(id: $id, userId: $userId, interests: $interests, hobbies: $hobbies, hobbiesVoiceUrl: $hobbiesVoiceUrl, favoriteArtists: $favoriteArtists, bio: $bio, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._interests,
              _interests,
            ) &&
            (identical(other.hobbies, hobbies) || other.hobbies == hobbies) &&
            (identical(other.hobbiesVoiceUrl, hobbiesVoiceUrl) ||
                other.hobbiesVoiceUrl == hobbiesVoiceUrl) &&
            const DeepCollectionEquality().equals(
              other._favoriteArtists,
              _favoriteArtists,
            ) &&
            (identical(other.bio, bio) || other.bio == bio) &&
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
    const DeepCollectionEquality().hash(_interests),
    hobbies,
    hobbiesVoiceUrl,
    const DeepCollectionEquality().hash(_favoriteArtists),
    bio,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileEntityImplToJson(this);
  }
}

abstract class _ProfileEntity implements ProfileEntity {
  const factory _ProfileEntity({
    required final int id,
    required final int userId,
    required final List<String> interests,
    required final String hobbies,
    final String? hobbiesVoiceUrl,
    required final List<String> favoriteArtists,
    required final String bio,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$ProfileEntityImpl;

  factory _ProfileEntity.fromJson(Map<String, dynamic> json) =
      _$ProfileEntityImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  List<String> get interests;
  @override
  String get hobbies;
  @override
  String? get hobbiesVoiceUrl;
  @override
  List<String> get favoriteArtists;
  @override
  String get bio;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) {
  return _ProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileRequest {
  List<String> get interests => throw _privateConstructorUsedError;
  String get hobbies => throw _privateConstructorUsedError;
  String? get hobbiesVoiceUrl => throw _privateConstructorUsedError;
  List<String> get favoriteArtists => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;

  /// Serializes this ProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileRequestCopyWith<ProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileRequestCopyWith<$Res> {
  factory $ProfileRequestCopyWith(
    ProfileRequest value,
    $Res Function(ProfileRequest) then,
  ) = _$ProfileRequestCopyWithImpl<$Res, ProfileRequest>;
  @useResult
  $Res call({
    List<String> interests,
    String hobbies,
    String? hobbiesVoiceUrl,
    List<String> favoriteArtists,
    String bio,
  });
}

/// @nodoc
class _$ProfileRequestCopyWithImpl<$Res, $Val extends ProfileRequest>
    implements $ProfileRequestCopyWith<$Res> {
  _$ProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? hobbies = null,
    Object? hobbiesVoiceUrl = freezed,
    Object? favoriteArtists = null,
    Object? bio = null,
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
                      as String,
            hobbiesVoiceUrl: freezed == hobbiesVoiceUrl
                ? _value.hobbiesVoiceUrl
                : hobbiesVoiceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            favoriteArtists: null == favoriteArtists
                ? _value.favoriteArtists
                : favoriteArtists // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileRequestImplCopyWith<$Res>
    implements $ProfileRequestCopyWith<$Res> {
  factory _$$ProfileRequestImplCopyWith(
    _$ProfileRequestImpl value,
    $Res Function(_$ProfileRequestImpl) then,
  ) = __$$ProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> interests,
    String hobbies,
    String? hobbiesVoiceUrl,
    List<String> favoriteArtists,
    String bio,
  });
}

/// @nodoc
class __$$ProfileRequestImplCopyWithImpl<$Res>
    extends _$ProfileRequestCopyWithImpl<$Res, _$ProfileRequestImpl>
    implements _$$ProfileRequestImplCopyWith<$Res> {
  __$$ProfileRequestImplCopyWithImpl(
    _$ProfileRequestImpl _value,
    $Res Function(_$ProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? hobbies = null,
    Object? hobbiesVoiceUrl = freezed,
    Object? favoriteArtists = null,
    Object? bio = null,
  }) {
    return _then(
      _$ProfileRequestImpl(
        interests: null == interests
            ? _value._interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hobbies: null == hobbies
            ? _value.hobbies
            : hobbies // ignore: cast_nullable_to_non_nullable
                  as String,
        hobbiesVoiceUrl: freezed == hobbiesVoiceUrl
            ? _value.hobbiesVoiceUrl
            : hobbiesVoiceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteArtists: null == favoriteArtists
            ? _value._favoriteArtists
            : favoriteArtists // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileRequestImpl implements _ProfileRequest {
  const _$ProfileRequestImpl({
    required final List<String> interests,
    required this.hobbies,
    this.hobbiesVoiceUrl,
    required final List<String> favoriteArtists,
    required this.bio,
  }) : _interests = interests,
       _favoriteArtists = favoriteArtists;

  factory _$ProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileRequestImplFromJson(json);

  final List<String> _interests;
  @override
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  final String hobbies;
  @override
  final String? hobbiesVoiceUrl;
  final List<String> _favoriteArtists;
  @override
  List<String> get favoriteArtists {
    if (_favoriteArtists is EqualUnmodifiableListView) return _favoriteArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteArtists);
  }

  @override
  final String bio;

  @override
  String toString() {
    return 'ProfileRequest(interests: $interests, hobbies: $hobbies, hobbiesVoiceUrl: $hobbiesVoiceUrl, favoriteArtists: $favoriteArtists, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRequestImpl &&
            const DeepCollectionEquality().equals(
              other._interests,
              _interests,
            ) &&
            (identical(other.hobbies, hobbies) || other.hobbies == hobbies) &&
            (identical(other.hobbiesVoiceUrl, hobbiesVoiceUrl) ||
                other.hobbiesVoiceUrl == hobbiesVoiceUrl) &&
            const DeepCollectionEquality().equals(
              other._favoriteArtists,
              _favoriteArtists,
            ) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_interests),
    hobbies,
    hobbiesVoiceUrl,
    const DeepCollectionEquality().hash(_favoriteArtists),
    bio,
  );

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      __$$ProfileRequestImplCopyWithImpl<_$ProfileRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileRequestImplToJson(this);
  }
}

abstract class _ProfileRequest implements ProfileRequest {
  const factory _ProfileRequest({
    required final List<String> interests,
    required final String hobbies,
    final String? hobbiesVoiceUrl,
    required final List<String> favoriteArtists,
    required final String bio,
  }) = _$ProfileRequestImpl;

  factory _ProfileRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileRequestImpl.fromJson;

  @override
  List<String> get interests;
  @override
  String get hobbies;
  @override
  String? get hobbiesVoiceUrl;
  @override
  List<String> get favoriteArtists;
  @override
  String get bio;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
