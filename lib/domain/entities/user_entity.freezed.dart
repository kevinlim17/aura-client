// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name =>
      throw _privateConstructorUsedError; // Name is not returned from register endpoint
  UserType get userType => throw _privateConstructorUsedError;
  bool get isVisuallyImpaired => throw _privateConstructorUsedError;
  ImpairmentLevel get impairmentLevel => throw _privateConstructorUsedError;
  bool get isOnboardingCompleted => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
    UserEntity value,
    $Res Function(UserEntity) then,
  ) = _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({
    String id,
    String email,
    String? name,
    UserType userType,
    bool isVisuallyImpaired,
    ImpairmentLevel impairmentLevel,
    bool isOnboardingCompleted,
    DateTime createdAt,
    DateTime? lastLoginAt,
    String? profileImageUrl,
  });
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? userType = null,
    Object? isVisuallyImpaired = null,
    Object? impairmentLevel = null,
    Object? isOnboardingCompleted = null,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            userType: null == userType
                ? _value.userType
                : userType // ignore: cast_nullable_to_non_nullable
                      as UserType,
            isVisuallyImpaired: null == isVisuallyImpaired
                ? _value.isVisuallyImpaired
                : isVisuallyImpaired // ignore: cast_nullable_to_non_nullable
                      as bool,
            impairmentLevel: null == impairmentLevel
                ? _value.impairmentLevel
                : impairmentLevel // ignore: cast_nullable_to_non_nullable
                      as ImpairmentLevel,
            isOnboardingCompleted: null == isOnboardingCompleted
                ? _value.isOnboardingCompleted
                : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastLoginAt: freezed == lastLoginAt
                ? _value.lastLoginAt
                : lastLoginAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            profileImageUrl: freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
    _$UserEntityImpl value,
    $Res Function(_$UserEntityImpl) then,
  ) = __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String? name,
    UserType userType,
    bool isVisuallyImpaired,
    ImpairmentLevel impairmentLevel,
    bool isOnboardingCompleted,
    DateTime createdAt,
    DateTime? lastLoginAt,
    String? profileImageUrl,
  });
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
    _$UserEntityImpl _value,
    $Res Function(_$UserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? userType = null,
    Object? isVisuallyImpaired = null,
    Object? impairmentLevel = null,
    Object? isOnboardingCompleted = null,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _$UserEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        userType: null == userType
            ? _value.userType
            : userType // ignore: cast_nullable_to_non_nullable
                  as UserType,
        isVisuallyImpaired: null == isVisuallyImpaired
            ? _value.isVisuallyImpaired
            : isVisuallyImpaired // ignore: cast_nullable_to_non_nullable
                  as bool,
        impairmentLevel: null == impairmentLevel
            ? _value.impairmentLevel
            : impairmentLevel // ignore: cast_nullable_to_non_nullable
                  as ImpairmentLevel,
        isOnboardingCompleted: null == isOnboardingCompleted
            ? _value.isOnboardingCompleted
            : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastLoginAt: freezed == lastLoginAt
            ? _value.lastLoginAt
            : lastLoginAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        profileImageUrl: freezed == profileImageUrl
            ? _value.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl({
    required this.id,
    required this.email,
    this.name,
    required this.userType,
    required this.isVisuallyImpaired,
    required this.impairmentLevel,
    required this.isOnboardingCompleted,
    required this.createdAt,
    this.lastLoginAt,
    this.profileImageUrl,
  });

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  // Name is not returned from register endpoint
  @override
  final UserType userType;
  @override
  final bool isVisuallyImpaired;
  @override
  final ImpairmentLevel impairmentLevel;
  @override
  final bool isOnboardingCompleted;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, userType: $userType, isVisuallyImpaired: $isVisuallyImpaired, impairmentLevel: $impairmentLevel, isOnboardingCompleted: $isOnboardingCompleted, createdAt: $createdAt, lastLoginAt: $lastLoginAt, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isVisuallyImpaired, isVisuallyImpaired) ||
                other.isVisuallyImpaired == isVisuallyImpaired) &&
            (identical(other.impairmentLevel, impairmentLevel) ||
                other.impairmentLevel == impairmentLevel) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    name,
    userType,
    isVisuallyImpaired,
    impairmentLevel,
    isOnboardingCompleted,
    createdAt,
    lastLoginAt,
    profileImageUrl,
  );

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(this);
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity({
    required final String id,
    required final String email,
    final String? name,
    required final UserType userType,
    required final bool isVisuallyImpaired,
    required final ImpairmentLevel impairmentLevel,
    required final bool isOnboardingCompleted,
    required final DateTime createdAt,
    final DateTime? lastLoginAt,
    final String? profileImageUrl,
  }) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name; // Name is not returned from register endpoint
  @override
  UserType get userType;
  @override
  bool get isVisuallyImpaired;
  @override
  ImpairmentLevel get impairmentLevel;
  @override
  bool get isOnboardingCompleted;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  String? get profileImageUrl;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
