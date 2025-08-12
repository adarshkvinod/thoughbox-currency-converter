// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Status {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusInitialImplCopyWith<$Res> {
  factory _$$StatusInitialImplCopyWith(
    _$StatusInitialImpl value,
    $Res Function(_$StatusInitialImpl) then,
  ) = __$$StatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusInitialImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusInitialImpl>
    implements _$$StatusInitialImplCopyWith<$Res> {
  __$$StatusInitialImplCopyWithImpl(
    _$StatusInitialImpl _value,
    $Res Function(_$StatusInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusInitialImpl extends StatusInitial {
  _$StatusInitialImpl() : super._();

  @override
  String toString() {
    return 'Status.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
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
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StatusInitial extends Status {
  factory StatusInitial() = _$StatusInitialImpl;
  StatusInitial._() : super._();
}

/// @nodoc
abstract class _$$StatusLoadingImplCopyWith<$Res> {
  factory _$$StatusLoadingImplCopyWith(
    _$StatusLoadingImpl value,
    $Res Function(_$StatusLoadingImpl) then,
  ) = __$$StatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusLoadingImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusLoadingImpl>
    implements _$$StatusLoadingImplCopyWith<$Res> {
  __$$StatusLoadingImplCopyWithImpl(
    _$StatusLoadingImpl _value,
    $Res Function(_$StatusLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusLoadingImpl extends StatusLoading {
  _$StatusLoadingImpl() : super._();

  @override
  String toString() {
    return 'Status.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
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
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StatusLoading extends Status {
  factory StatusLoading() = _$StatusLoadingImpl;
  StatusLoading._() : super._();
}

/// @nodoc
abstract class _$$StatusSuccessImplCopyWith<$Res> {
  factory _$$StatusSuccessImplCopyWith(
    _$StatusSuccessImpl value,
    $Res Function(_$StatusSuccessImpl) then,
  ) = __$$StatusSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusSuccessImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusSuccessImpl>
    implements _$$StatusSuccessImplCopyWith<$Res> {
  __$$StatusSuccessImplCopyWithImpl(
    _$StatusSuccessImpl _value,
    $Res Function(_$StatusSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusSuccessImpl extends StatusSuccess {
  _$StatusSuccessImpl() : super._();

  @override
  String toString() {
    return 'Status.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class StatusSuccess extends Status {
  factory StatusSuccess() = _$StatusSuccessImpl;
  StatusSuccess._() : super._();
}

/// @nodoc
abstract class _$$StatusFailureImplCopyWith<$Res> {
  factory _$$StatusFailureImplCopyWith(
    _$StatusFailureImpl value,
    $Res Function(_$StatusFailureImpl) then,
  ) = __$$StatusFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$StatusFailureImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusFailureImpl>
    implements _$$StatusFailureImplCopyWith<$Res> {
  __$$StatusFailureImplCopyWithImpl(
    _$StatusFailureImpl _value,
    $Res Function(_$StatusFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errorMessage = null}) {
    return _then(
      _$StatusFailureImpl(
        null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StatusFailureImpl extends StatusFailure {
  _$StatusFailureImpl(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'Status.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusFailureImplCopyWith<_$StatusFailureImpl> get copyWith =>
      __$$StatusFailureImplCopyWithImpl<_$StatusFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class StatusFailure extends Status {
  factory StatusFailure(final String errorMessage) = _$StatusFailureImpl;
  StatusFailure._() : super._();

  String get errorMessage;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusFailureImplCopyWith<_$StatusFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusAuthFailureImplCopyWith<$Res> {
  factory _$$StatusAuthFailureImplCopyWith(
    _$StatusAuthFailureImpl value,
    $Res Function(_$StatusAuthFailureImpl) then,
  ) = __$$StatusAuthFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$StatusAuthFailureImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusAuthFailureImpl>
    implements _$$StatusAuthFailureImplCopyWith<$Res> {
  __$$StatusAuthFailureImplCopyWithImpl(
    _$StatusAuthFailureImpl _value,
    $Res Function(_$StatusAuthFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errorMessage = null}) {
    return _then(
      _$StatusAuthFailureImpl(
        null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StatusAuthFailureImpl extends StatusAuthFailure {
  _$StatusAuthFailureImpl(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'Status.authFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusAuthFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusAuthFailureImplCopyWith<_$StatusAuthFailureImpl> get copyWith =>
      __$$StatusAuthFailureImplCopyWithImpl<_$StatusAuthFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
    required TResult Function(String errorMessage) authFailure,
  }) {
    return authFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(String errorMessage)? authFailure,
  }) {
    return authFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    TResult Function(String errorMessage)? authFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusInitial value) initial,
    required TResult Function(StatusLoading value) loading,
    required TResult Function(StatusSuccess value) success,
    required TResult Function(StatusFailure value) failure,
    required TResult Function(StatusAuthFailure value) authFailure,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusInitial value)? initial,
    TResult? Function(StatusLoading value)? loading,
    TResult? Function(StatusSuccess value)? success,
    TResult? Function(StatusFailure value)? failure,
    TResult? Function(StatusAuthFailure value)? authFailure,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusInitial value)? initial,
    TResult Function(StatusLoading value)? loading,
    TResult Function(StatusSuccess value)? success,
    TResult Function(StatusFailure value)? failure,
    TResult Function(StatusAuthFailure value)? authFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class StatusAuthFailure extends Status {
  factory StatusAuthFailure(final String errorMessage) =
      _$StatusAuthFailureImpl;
  StatusAuthFailure._() : super._();

  String get errorMessage;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusAuthFailureImplCopyWith<_$StatusAuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
