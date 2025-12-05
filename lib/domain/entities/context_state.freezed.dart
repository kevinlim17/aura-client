// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ContextState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextStateCopyWith<$Res> {
  factory $ContextStateCopyWith(
    ContextState value,
    $Res Function(ContextState) then,
  ) = _$ContextStateCopyWithImpl<$Res, ContextState>;
}

/// @nodoc
class _$ContextStateCopyWithImpl<$Res, $Val extends ContextState>
    implements $ContextStateCopyWith<$Res> {
  _$ContextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl value,
    $Res Function(_$IdleImpl) then,
  ) = __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
    : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'ContextState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ContextState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ContextState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ContextState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SubmittingImplCopyWith<$Res> {
  factory _$$SubmittingImplCopyWith(
    _$SubmittingImpl value,
    $Res Function(_$SubmittingImpl) then,
  ) = __$$SubmittingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SubmittingImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$SubmittingImpl>
    implements _$$SubmittingImplCopyWith<$Res> {
  __$$SubmittingImplCopyWithImpl(
    _$SubmittingImpl _value,
    $Res Function(_$SubmittingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SubmittingImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SubmittingImpl implements _Submitting {
  const _$SubmittingImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ContextState.submitting(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmittingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmittingImplCopyWith<_$SubmittingImpl> get copyWith =>
      __$$SubmittingImplCopyWithImpl<_$SubmittingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return submitting(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return submitting?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _Submitting implements ContextState {
  const factory _Submitting({required final String message}) = _$SubmittingImpl;

  String get message;

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmittingImplCopyWith<_$SubmittingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ContextEntity context, String message});

  $ContextEntityCopyWith<$Res> get context;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? context = null, Object? message = null}) {
    return _then(
      _$SuccessImpl(
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as ContextEntity,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextEntityCopyWith<$Res> get context {
    return $ContextEntityCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.context, required this.message});

  @override
  final ContextEntity context;
  @override
  final String message;

  @override
  String toString() {
    return 'ContextState.success(context: $context, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, message);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return success(context, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return success?.call(context, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(context, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ContextState {
  const factory _Success({
    required final ContextEntity context,
    required final String message,
  }) = _$SuccessImpl;

  ContextEntity get context;
  String get message;

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'ContextState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ContextState {
  const factory _Error({required final String message, final String? code}) =
      _$ErrorImpl;

  String get message;
  String? get code;

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordingImplCopyWith<$Res> {
  factory _$$RecordingImplCopyWith(
    _$RecordingImpl value,
    $Res Function(_$RecordingImpl) then,
  ) = __$$RecordingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RecordingState recordingState, Duration duration});
}

/// @nodoc
class __$$RecordingImplCopyWithImpl<$Res>
    extends _$ContextStateCopyWithImpl<$Res, _$RecordingImpl>
    implements _$$RecordingImplCopyWith<$Res> {
  __$$RecordingImplCopyWithImpl(
    _$RecordingImpl _value,
    $Res Function(_$RecordingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? recordingState = null, Object? duration = null}) {
    return _then(
      _$RecordingImpl(
        recordingState: null == recordingState
            ? _value.recordingState
            : recordingState // ignore: cast_nullable_to_non_nullable
                  as RecordingState,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$RecordingImpl implements _Recording {
  const _$RecordingImpl({required this.recordingState, required this.duration});

  @override
  final RecordingState recordingState;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'ContextState.recording(recordingState: $recordingState, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingImpl &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recordingState, duration);

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      __$$RecordingImplCopyWithImpl<_$RecordingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String message) submitting,
    required TResult Function(ContextEntity context, String message) success,
    required TResult Function(String message, String? code) error,
    required TResult Function(RecordingState recordingState, Duration duration)
    recording,
  }) {
    return recording(recordingState, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(String message)? submitting,
    TResult? Function(ContextEntity context, String message)? success,
    TResult? Function(String message, String? code)? error,
    TResult? Function(RecordingState recordingState, Duration duration)?
    recording,
  }) {
    return recording?.call(recordingState, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String message)? submitting,
    TResult Function(ContextEntity context, String message)? success,
    TResult Function(String message, String? code)? error,
    TResult Function(RecordingState recordingState, Duration duration)?
    recording,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(recordingState, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
  }) {
    return recording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Recording value)? recording,
  }) {
    return recording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(this);
    }
    return orElse();
  }
}

abstract class _Recording implements ContextState {
  const factory _Recording({
    required final RecordingState recordingState,
    required final Duration duration,
  }) = _$RecordingImpl;

  RecordingState get recordingState;
  Duration get duration;

  /// Create a copy of ContextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContextListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )
    loaded,
    required TResult Function(String message, String? code) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult? Function(String message, String? code)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContextListLoading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ContextListError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContextListLoading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ContextListError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContextListLoading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ContextListError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextListStateCopyWith<$Res> {
  factory $ContextListStateCopyWith(
    ContextListState value,
    $Res Function(ContextListState) then,
  ) = _$ContextListStateCopyWithImpl<$Res, ContextListState>;
}

/// @nodoc
class _$ContextListStateCopyWithImpl<$Res, $Val extends ContextListState>
    implements $ContextListStateCopyWith<$Res> {
  _$ContextListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextListState
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
    extends _$ContextListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ContextListState.initial()';
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
    required TResult Function() loading,
    required TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )
    loaded,
    required TResult Function(String message, String? code) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult? Function(String message, String? code)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult Function(String message, String? code)? error,
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
    required TResult Function(_ContextListLoading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ContextListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContextListLoading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ContextListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContextListLoading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ContextListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ContextListState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ContextListLoadingImplCopyWith<$Res> {
  factory _$$ContextListLoadingImplCopyWith(
    _$ContextListLoadingImpl value,
    $Res Function(_$ContextListLoadingImpl) then,
  ) = __$$ContextListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContextListLoadingImplCopyWithImpl<$Res>
    extends _$ContextListStateCopyWithImpl<$Res, _$ContextListLoadingImpl>
    implements _$$ContextListLoadingImplCopyWith<$Res> {
  __$$ContextListLoadingImplCopyWithImpl(
    _$ContextListLoadingImpl _value,
    $Res Function(_$ContextListLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContextListLoadingImpl implements _ContextListLoading {
  const _$ContextListLoadingImpl();

  @override
  String toString() {
    return 'ContextListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContextListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )
    loaded,
    required TResult Function(String message, String? code) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult? Function(String message, String? code)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContextListLoading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ContextListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContextListLoading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ContextListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContextListLoading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ContextListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ContextListLoading implements ContextListState {
  const factory _ContextListLoading() = _$ContextListLoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ContextEntity> contexts, int currentPage, bool hasMore});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ContextListStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contexts = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$LoadedImpl(
        contexts: null == contexts
            ? _value._contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<ContextEntity>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    required final List<ContextEntity> contexts,
    required this.currentPage,
    required this.hasMore,
  }) : _contexts = contexts;

  final List<ContextEntity> _contexts;
  @override
  List<ContextEntity> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  @override
  final int currentPage;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ContextListState.loaded(contexts: $contexts, currentPage: $currentPage, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_contexts),
    currentPage,
    hasMore,
  );

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )
    loaded,
    required TResult Function(String message, String? code) error,
  }) {
    return loaded(contexts, currentPage, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult? Function(String message, String? code)? error,
  }) {
    return loaded?.call(contexts, currentPage, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(contexts, currentPage, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContextListLoading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ContextListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContextListLoading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ContextListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContextListLoading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ContextListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ContextListState {
  const factory _Loaded({
    required final List<ContextEntity> contexts,
    required final int currentPage,
    required final bool hasMore,
  }) = _$LoadedImpl;

  List<ContextEntity> get contexts;
  int get currentPage;
  bool get hasMore;

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContextListErrorImplCopyWith<$Res> {
  factory _$$ContextListErrorImplCopyWith(
    _$ContextListErrorImpl value,
    $Res Function(_$ContextListErrorImpl) then,
  ) = __$$ContextListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$ContextListErrorImplCopyWithImpl<$Res>
    extends _$ContextListStateCopyWithImpl<$Res, _$ContextListErrorImpl>
    implements _$$ContextListErrorImplCopyWith<$Res> {
  __$$ContextListErrorImplCopyWithImpl(
    _$ContextListErrorImpl _value,
    $Res Function(_$ContextListErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$ContextListErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ContextListErrorImpl implements _ContextListError {
  const _$ContextListErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'ContextListState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextListErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextListErrorImplCopyWith<_$ContextListErrorImpl> get copyWith =>
      __$$ContextListErrorImplCopyWithImpl<_$ContextListErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )
    loaded,
    required TResult Function(String message, String? code) error,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult? Function(String message, String? code)? error,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<ContextEntity> contexts,
      int currentPage,
      bool hasMore,
    )?
    loaded,
    TResult Function(String message, String? code)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContextListLoading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ContextListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContextListLoading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ContextListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContextListLoading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ContextListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ContextListError implements ContextListState {
  const factory _ContextListError({
    required final String message,
    final String? code,
  }) = _$ContextListErrorImpl;

  String get message;
  String? get code;

  /// Create a copy of ContextListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextListErrorImplCopyWith<_$ContextListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmotionTagsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> recommendedTags) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> recommendedTags)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> recommendedTags)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmotionTagsInitial value) initial,
    required TResult Function(_EmotionTagsLoading value) loading,
    required TResult Function(_EmotionTagsLoaded value) loaded,
    required TResult Function(_EmotionTagsError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmotionTagsInitial value)? initial,
    TResult? Function(_EmotionTagsLoading value)? loading,
    TResult? Function(_EmotionTagsLoaded value)? loaded,
    TResult? Function(_EmotionTagsError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmotionTagsInitial value)? initial,
    TResult Function(_EmotionTagsLoading value)? loading,
    TResult Function(_EmotionTagsLoaded value)? loaded,
    TResult Function(_EmotionTagsError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionTagsStateCopyWith<$Res> {
  factory $EmotionTagsStateCopyWith(
    EmotionTagsState value,
    $Res Function(EmotionTagsState) then,
  ) = _$EmotionTagsStateCopyWithImpl<$Res, EmotionTagsState>;
}

/// @nodoc
class _$EmotionTagsStateCopyWithImpl<$Res, $Val extends EmotionTagsState>
    implements $EmotionTagsStateCopyWith<$Res> {
  _$EmotionTagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmotionTagsInitialImplCopyWith<$Res> {
  factory _$$EmotionTagsInitialImplCopyWith(
    _$EmotionTagsInitialImpl value,
    $Res Function(_$EmotionTagsInitialImpl) then,
  ) = __$$EmotionTagsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmotionTagsInitialImplCopyWithImpl<$Res>
    extends _$EmotionTagsStateCopyWithImpl<$Res, _$EmotionTagsInitialImpl>
    implements _$$EmotionTagsInitialImplCopyWith<$Res> {
  __$$EmotionTagsInitialImplCopyWithImpl(
    _$EmotionTagsInitialImpl _value,
    $Res Function(_$EmotionTagsInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmotionTagsInitialImpl implements _EmotionTagsInitial {
  const _$EmotionTagsInitialImpl();

  @override
  String toString() {
    return 'EmotionTagsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmotionTagsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> recommendedTags) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> recommendedTags)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> recommendedTags)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_EmotionTagsInitial value) initial,
    required TResult Function(_EmotionTagsLoading value) loading,
    required TResult Function(_EmotionTagsLoaded value) loaded,
    required TResult Function(_EmotionTagsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmotionTagsInitial value)? initial,
    TResult? Function(_EmotionTagsLoading value)? loading,
    TResult? Function(_EmotionTagsLoaded value)? loaded,
    TResult? Function(_EmotionTagsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmotionTagsInitial value)? initial,
    TResult Function(_EmotionTagsLoading value)? loading,
    TResult Function(_EmotionTagsLoaded value)? loaded,
    TResult Function(_EmotionTagsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _EmotionTagsInitial implements EmotionTagsState {
  const factory _EmotionTagsInitial() = _$EmotionTagsInitialImpl;
}

/// @nodoc
abstract class _$$EmotionTagsLoadingImplCopyWith<$Res> {
  factory _$$EmotionTagsLoadingImplCopyWith(
    _$EmotionTagsLoadingImpl value,
    $Res Function(_$EmotionTagsLoadingImpl) then,
  ) = __$$EmotionTagsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmotionTagsLoadingImplCopyWithImpl<$Res>
    extends _$EmotionTagsStateCopyWithImpl<$Res, _$EmotionTagsLoadingImpl>
    implements _$$EmotionTagsLoadingImplCopyWith<$Res> {
  __$$EmotionTagsLoadingImplCopyWithImpl(
    _$EmotionTagsLoadingImpl _value,
    $Res Function(_$EmotionTagsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmotionTagsLoadingImpl implements _EmotionTagsLoading {
  const _$EmotionTagsLoadingImpl();

  @override
  String toString() {
    return 'EmotionTagsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmotionTagsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> recommendedTags) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> recommendedTags)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> recommendedTags)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmotionTagsInitial value) initial,
    required TResult Function(_EmotionTagsLoading value) loading,
    required TResult Function(_EmotionTagsLoaded value) loaded,
    required TResult Function(_EmotionTagsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmotionTagsInitial value)? initial,
    TResult? Function(_EmotionTagsLoading value)? loading,
    TResult? Function(_EmotionTagsLoaded value)? loaded,
    TResult? Function(_EmotionTagsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmotionTagsInitial value)? initial,
    TResult Function(_EmotionTagsLoading value)? loading,
    TResult Function(_EmotionTagsLoaded value)? loaded,
    TResult Function(_EmotionTagsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _EmotionTagsLoading implements EmotionTagsState {
  const factory _EmotionTagsLoading() = _$EmotionTagsLoadingImpl;
}

/// @nodoc
abstract class _$$EmotionTagsLoadedImplCopyWith<$Res> {
  factory _$$EmotionTagsLoadedImplCopyWith(
    _$EmotionTagsLoadedImpl value,
    $Res Function(_$EmotionTagsLoadedImpl) then,
  ) = __$$EmotionTagsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> recommendedTags});
}

/// @nodoc
class __$$EmotionTagsLoadedImplCopyWithImpl<$Res>
    extends _$EmotionTagsStateCopyWithImpl<$Res, _$EmotionTagsLoadedImpl>
    implements _$$EmotionTagsLoadedImplCopyWith<$Res> {
  __$$EmotionTagsLoadedImplCopyWithImpl(
    _$EmotionTagsLoadedImpl _value,
    $Res Function(_$EmotionTagsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? recommendedTags = null}) {
    return _then(
      _$EmotionTagsLoadedImpl(
        recommendedTags: null == recommendedTags
            ? _value._recommendedTags
            : recommendedTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$EmotionTagsLoadedImpl implements _EmotionTagsLoaded {
  const _$EmotionTagsLoadedImpl({required final List<String> recommendedTags})
    : _recommendedTags = recommendedTags;

  final List<String> _recommendedTags;
  @override
  List<String> get recommendedTags {
    if (_recommendedTags is EqualUnmodifiableListView) return _recommendedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedTags);
  }

  @override
  String toString() {
    return 'EmotionTagsState.loaded(recommendedTags: $recommendedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionTagsLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._recommendedTags,
              _recommendedTags,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recommendedTags),
  );

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionTagsLoadedImplCopyWith<_$EmotionTagsLoadedImpl> get copyWith =>
      __$$EmotionTagsLoadedImplCopyWithImpl<_$EmotionTagsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> recommendedTags) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(recommendedTags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> recommendedTags)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(recommendedTags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> recommendedTags)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(recommendedTags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmotionTagsInitial value) initial,
    required TResult Function(_EmotionTagsLoading value) loading,
    required TResult Function(_EmotionTagsLoaded value) loaded,
    required TResult Function(_EmotionTagsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmotionTagsInitial value)? initial,
    TResult? Function(_EmotionTagsLoading value)? loading,
    TResult? Function(_EmotionTagsLoaded value)? loaded,
    TResult? Function(_EmotionTagsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmotionTagsInitial value)? initial,
    TResult Function(_EmotionTagsLoading value)? loading,
    TResult Function(_EmotionTagsLoaded value)? loaded,
    TResult Function(_EmotionTagsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _EmotionTagsLoaded implements EmotionTagsState {
  const factory _EmotionTagsLoaded({
    required final List<String> recommendedTags,
  }) = _$EmotionTagsLoadedImpl;

  List<String> get recommendedTags;

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionTagsLoadedImplCopyWith<_$EmotionTagsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmotionTagsErrorImplCopyWith<$Res> {
  factory _$$EmotionTagsErrorImplCopyWith(
    _$EmotionTagsErrorImpl value,
    $Res Function(_$EmotionTagsErrorImpl) then,
  ) = __$$EmotionTagsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmotionTagsErrorImplCopyWithImpl<$Res>
    extends _$EmotionTagsStateCopyWithImpl<$Res, _$EmotionTagsErrorImpl>
    implements _$$EmotionTagsErrorImplCopyWith<$Res> {
  __$$EmotionTagsErrorImplCopyWithImpl(
    _$EmotionTagsErrorImpl _value,
    $Res Function(_$EmotionTagsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$EmotionTagsErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EmotionTagsErrorImpl implements _EmotionTagsError {
  const _$EmotionTagsErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'EmotionTagsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionTagsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionTagsErrorImplCopyWith<_$EmotionTagsErrorImpl> get copyWith =>
      __$$EmotionTagsErrorImplCopyWithImpl<_$EmotionTagsErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> recommendedTags) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> recommendedTags)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> recommendedTags)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmotionTagsInitial value) initial,
    required TResult Function(_EmotionTagsLoading value) loading,
    required TResult Function(_EmotionTagsLoaded value) loaded,
    required TResult Function(_EmotionTagsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmotionTagsInitial value)? initial,
    TResult? Function(_EmotionTagsLoading value)? loading,
    TResult? Function(_EmotionTagsLoaded value)? loaded,
    TResult? Function(_EmotionTagsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmotionTagsInitial value)? initial,
    TResult Function(_EmotionTagsLoading value)? loading,
    TResult Function(_EmotionTagsLoaded value)? loaded,
    TResult Function(_EmotionTagsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _EmotionTagsError implements EmotionTagsState {
  const factory _EmotionTagsError({required final String message}) =
      _$EmotionTagsErrorImpl;

  String get message;

  /// Create a copy of EmotionTagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionTagsErrorImplCopyWith<_$EmotionTagsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
