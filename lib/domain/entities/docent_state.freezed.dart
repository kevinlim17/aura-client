// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DocentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )
    generating,
    required TResult Function(DocentSessionEntity session) completed,
    required TResult Function(String errorMessage, int? sessionId) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult? Function(DocentSessionEntity session)? completed,
    TResult? Function(String errorMessage, int? sessionId)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult Function(DocentSessionEntity session)? completed,
    TResult Function(String errorMessage, int? sessionId)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocentStateCopyWith<$Res> {
  factory $DocentStateCopyWith(
    DocentState value,
    $Res Function(DocentState) then,
  ) = _$DocentStateCopyWithImpl<$Res, DocentState>;
}

/// @nodoc
class _$DocentStateCopyWithImpl<$Res, $Val extends DocentState>
    implements $DocentStateCopyWith<$Res> {
  _$DocentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DocentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'DocentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )
    generating,
    required TResult Function(DocentSessionEntity session) completed,
    required TResult Function(String errorMessage, int? sessionId) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult? Function(DocentSessionEntity session)? completed,
    TResult? Function(String errorMessage, int? sessionId)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult Function(DocentSessionEntity session)? completed,
    TResult Function(String errorMessage, int? sessionId)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends DocentState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$GeneratingImplCopyWith<$Res> {
  factory _$$GeneratingImplCopyWith(
    _$GeneratingImpl value,
    $Res Function(_$GeneratingImpl) then,
  ) = __$$GeneratingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    int sessionId,
    int estimatedTimeSeconds,
    int progress,
    DateTime? startTime,
  });
}

/// @nodoc
class __$$GeneratingImplCopyWithImpl<$Res>
    extends _$DocentStateCopyWithImpl<$Res, _$GeneratingImpl>
    implements _$$GeneratingImplCopyWith<$Res> {
  __$$GeneratingImplCopyWithImpl(
    _$GeneratingImpl _value,
    $Res Function(_$GeneratingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? estimatedTimeSeconds = null,
    Object? progress = null,
    Object? startTime = freezed,
  }) {
    return _then(
      _$GeneratingImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedTimeSeconds: null == estimatedTimeSeconds
            ? _value.estimatedTimeSeconds
            : estimatedTimeSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$GeneratingImpl extends _Generating {
  const _$GeneratingImpl({
    required this.sessionId,
    required this.estimatedTimeSeconds,
    this.progress = 0,
    this.startTime,
  }) : super._();

  @override
  final int sessionId;
  @override
  final int estimatedTimeSeconds;
  @override
  @JsonKey()
  final int progress;
  @override
  final DateTime? startTime;

  @override
  String toString() {
    return 'DocentState.generating(sessionId: $sessionId, estimatedTimeSeconds: $estimatedTimeSeconds, progress: $progress, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.estimatedTimeSeconds, estimatedTimeSeconds) ||
                other.estimatedTimeSeconds == estimatedTimeSeconds) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    estimatedTimeSeconds,
    progress,
    startTime,
  );

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratingImplCopyWith<_$GeneratingImpl> get copyWith =>
      __$$GeneratingImplCopyWithImpl<_$GeneratingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )
    generating,
    required TResult Function(DocentSessionEntity session) completed,
    required TResult Function(String errorMessage, int? sessionId) failed,
  }) {
    return generating(sessionId, estimatedTimeSeconds, progress, startTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult? Function(DocentSessionEntity session)? completed,
    TResult? Function(String errorMessage, int? sessionId)? failed,
  }) {
    return generating?.call(
      sessionId,
      estimatedTimeSeconds,
      progress,
      startTime,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult Function(DocentSessionEntity session)? completed,
    TResult Function(String errorMessage, int? sessionId)? failed,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating(sessionId, estimatedTimeSeconds, progress, startTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return generating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return generating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating(this);
    }
    return orElse();
  }
}

abstract class _Generating extends DocentState {
  const factory _Generating({
    required final int sessionId,
    required final int estimatedTimeSeconds,
    final int progress,
    final DateTime? startTime,
  }) = _$GeneratingImpl;
  const _Generating._() : super._();

  int get sessionId;
  int get estimatedTimeSeconds;
  int get progress;
  DateTime? get startTime;

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratingImplCopyWith<_$GeneratingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
    _$CompletedImpl value,
    $Res Function(_$CompletedImpl) then,
  ) = __$$CompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DocentSessionEntity session});

  $DocentSessionEntityCopyWith<$Res> get session;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$DocentStateCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
    _$CompletedImpl _value,
    $Res Function(_$CompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? session = null}) {
    return _then(
      _$CompletedImpl(
        session: null == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as DocentSessionEntity,
      ),
    );
  }

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocentSessionEntityCopyWith<$Res> get session {
    return $DocentSessionEntityCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$CompletedImpl extends _Completed {
  const _$CompletedImpl({required this.session}) : super._();

  @override
  final DocentSessionEntity session;

  @override
  String toString() {
    return 'DocentState.completed(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedImplCopyWith<_$CompletedImpl> get copyWith =>
      __$$CompletedImplCopyWithImpl<_$CompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )
    generating,
    required TResult Function(DocentSessionEntity session) completed,
    required TResult Function(String errorMessage, int? sessionId) failed,
  }) {
    return completed(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult? Function(DocentSessionEntity session)? completed,
    TResult? Function(String errorMessage, int? sessionId)? failed,
  }) {
    return completed?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult Function(DocentSessionEntity session)? completed,
    TResult Function(String errorMessage, int? sessionId)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed extends DocentState {
  const factory _Completed({required final DocentSessionEntity session}) =
      _$CompletedImpl;
  const _Completed._() : super._();

  DocentSessionEntity get session;

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedImplCopyWith<_$CompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
    _$FailedImpl value,
    $Res Function(_$FailedImpl) then,
  ) = __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage, int? sessionId});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$DocentStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
    _$FailedImpl _value,
    $Res Function(_$FailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errorMessage = null, Object? sessionId = freezed}) {
    return _then(
      _$FailedImpl(
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$FailedImpl extends _Failed {
  const _$FailedImpl({required this.errorMessage, this.sessionId}) : super._();

  @override
  final String errorMessage;
  @override
  final int? sessionId;

  @override
  String toString() {
    return 'DocentState.failed(errorMessage: $errorMessage, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, sessionId);

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )
    generating,
    required TResult Function(DocentSessionEntity session) completed,
    required TResult Function(String errorMessage, int? sessionId) failed,
  }) {
    return failed(errorMessage, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult? Function(DocentSessionEntity session)? completed,
    TResult? Function(String errorMessage, int? sessionId)? failed,
  }) {
    return failed?.call(errorMessage, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      int sessionId,
      int estimatedTimeSeconds,
      int progress,
      DateTime? startTime,
    )?
    generating,
    TResult Function(DocentSessionEntity session)? completed,
    TResult Function(String errorMessage, int? sessionId)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(errorMessage, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed extends DocentState {
  const factory _Failed({
    required final String errorMessage,
    final int? sessionId,
  }) = _$FailedImpl;
  const _Failed._() : super._();

  String get errorMessage;
  int? get sessionId;

  /// Create a copy of DocentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
