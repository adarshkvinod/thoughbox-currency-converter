// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CurrencyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String from, String to, double amount)
    getConversionResult,
    required TResult Function() clearConversionData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String from, String to, double amount)?
    getConversionResult,
    TResult? Function()? clearConversionData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String from, String to, double amount)?
    getConversionResult,
    TResult Function()? clearConversionData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversionResult value) getConversionResult,
    required TResult Function(_ClearConversionData value) clearConversionData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversionResult value)? getConversionResult,
    TResult? Function(_ClearConversionData value)? clearConversionData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversionResult value)? getConversionResult,
    TResult Function(_ClearConversionData value)? clearConversionData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyEventCopyWith<$Res> {
  factory $CurrencyEventCopyWith(
    CurrencyEvent value,
    $Res Function(CurrencyEvent) then,
  ) = _$CurrencyEventCopyWithImpl<$Res, CurrencyEvent>;
}

/// @nodoc
class _$CurrencyEventCopyWithImpl<$Res, $Val extends CurrencyEvent>
    implements $CurrencyEventCopyWith<$Res> {
  _$CurrencyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetConversionResultImplCopyWith<$Res> {
  factory _$$GetConversionResultImplCopyWith(
    _$GetConversionResultImpl value,
    $Res Function(_$GetConversionResultImpl) then,
  ) = __$$GetConversionResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String from, String to, double amount});
}

/// @nodoc
class __$$GetConversionResultImplCopyWithImpl<$Res>
    extends _$CurrencyEventCopyWithImpl<$Res, _$GetConversionResultImpl>
    implements _$$GetConversionResultImplCopyWith<$Res> {
  __$$GetConversionResultImplCopyWithImpl(
    _$GetConversionResultImpl _value,
    $Res Function(_$GetConversionResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? from = null, Object? to = null, Object? amount = null}) {
    return _then(
      _$GetConversionResultImpl(
        from: null == from
            ? _value.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String,
        to: null == to
            ? _value.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$GetConversionResultImpl implements _GetConversionResult {
  _$GetConversionResultImpl({
    required this.from,
    required this.to,
    required this.amount,
  });

  @override
  final String from;
  @override
  final String to;
  @override
  final double amount;

  @override
  String toString() {
    return 'CurrencyEvent.getConversionResult(from: $from, to: $to, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConversionResultImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, amount);

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConversionResultImplCopyWith<_$GetConversionResultImpl> get copyWith =>
      __$$GetConversionResultImplCopyWithImpl<_$GetConversionResultImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String from, String to, double amount)
    getConversionResult,
    required TResult Function() clearConversionData,
  }) {
    return getConversionResult(from, to, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String from, String to, double amount)?
    getConversionResult,
    TResult? Function()? clearConversionData,
  }) {
    return getConversionResult?.call(from, to, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String from, String to, double amount)?
    getConversionResult,
    TResult Function()? clearConversionData,
    required TResult orElse(),
  }) {
    if (getConversionResult != null) {
      return getConversionResult(from, to, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversionResult value) getConversionResult,
    required TResult Function(_ClearConversionData value) clearConversionData,
  }) {
    return getConversionResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversionResult value)? getConversionResult,
    TResult? Function(_ClearConversionData value)? clearConversionData,
  }) {
    return getConversionResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversionResult value)? getConversionResult,
    TResult Function(_ClearConversionData value)? clearConversionData,
    required TResult orElse(),
  }) {
    if (getConversionResult != null) {
      return getConversionResult(this);
    }
    return orElse();
  }
}

abstract class _GetConversionResult implements CurrencyEvent {
  factory _GetConversionResult({
    required final String from,
    required final String to,
    required final double amount,
  }) = _$GetConversionResultImpl;

  String get from;
  String get to;
  double get amount;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetConversionResultImplCopyWith<_$GetConversionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearConversionDataImplCopyWith<$Res> {
  factory _$$ClearConversionDataImplCopyWith(
    _$ClearConversionDataImpl value,
    $Res Function(_$ClearConversionDataImpl) then,
  ) = __$$ClearConversionDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearConversionDataImplCopyWithImpl<$Res>
    extends _$CurrencyEventCopyWithImpl<$Res, _$ClearConversionDataImpl>
    implements _$$ClearConversionDataImplCopyWith<$Res> {
  __$$ClearConversionDataImplCopyWithImpl(
    _$ClearConversionDataImpl _value,
    $Res Function(_$ClearConversionDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearConversionDataImpl implements _ClearConversionData {
  const _$ClearConversionDataImpl();

  @override
  String toString() {
    return 'CurrencyEvent.clearConversionData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearConversionDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String from, String to, double amount)
    getConversionResult,
    required TResult Function() clearConversionData,
  }) {
    return clearConversionData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String from, String to, double amount)?
    getConversionResult,
    TResult? Function()? clearConversionData,
  }) {
    return clearConversionData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String from, String to, double amount)?
    getConversionResult,
    TResult Function()? clearConversionData,
    required TResult orElse(),
  }) {
    if (clearConversionData != null) {
      return clearConversionData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversionResult value) getConversionResult,
    required TResult Function(_ClearConversionData value) clearConversionData,
  }) {
    return clearConversionData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversionResult value)? getConversionResult,
    TResult? Function(_ClearConversionData value)? clearConversionData,
  }) {
    return clearConversionData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversionResult value)? getConversionResult,
    TResult Function(_ClearConversionData value)? clearConversionData,
    required TResult orElse(),
  }) {
    if (clearConversionData != null) {
      return clearConversionData(this);
    }
    return orElse();
  }
}

abstract class _ClearConversionData implements CurrencyEvent {
  const factory _ClearConversionData() = _$ClearConversionDataImpl;
}

/// @nodoc
mixin _$CurrencyState {
  Status get getConversionResultStatus => throw _privateConstructorUsedError;
  ConversionResultModel get conversionResult =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyStateCopyWith<CurrencyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyStateCopyWith<$Res> {
  factory $CurrencyStateCopyWith(
    CurrencyState value,
    $Res Function(CurrencyState) then,
  ) = _$CurrencyStateCopyWithImpl<$Res, CurrencyState>;
  @useResult
  $Res call({
    Status getConversionResultStatus,
    ConversionResultModel conversionResult,
  });

  $StatusCopyWith<$Res> get getConversionResultStatus;
  $ConversionResultModelCopyWith<$Res> get conversionResult;
}

/// @nodoc
class _$CurrencyStateCopyWithImpl<$Res, $Val extends CurrencyState>
    implements $CurrencyStateCopyWith<$Res> {
  _$CurrencyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getConversionResultStatus = null,
    Object? conversionResult = null,
  }) {
    return _then(
      _value.copyWith(
            getConversionResultStatus: null == getConversionResultStatus
                ? _value.getConversionResultStatus
                : getConversionResultStatus // ignore: cast_nullable_to_non_nullable
                      as Status,
            conversionResult: null == conversionResult
                ? _value.conversionResult
                : conversionResult // ignore: cast_nullable_to_non_nullable
                      as ConversionResultModel,
          )
          as $Val,
    );
  }

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get getConversionResultStatus {
    return $StatusCopyWith<$Res>(_value.getConversionResultStatus, (value) {
      return _then(_value.copyWith(getConversionResultStatus: value) as $Val);
    });
  }

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionResultModelCopyWith<$Res> get conversionResult {
    return $ConversionResultModelCopyWith<$Res>(_value.conversionResult, (
      value,
    ) {
      return _then(_value.copyWith(conversionResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyStateImplCopyWith<$Res>
    implements $CurrencyStateCopyWith<$Res> {
  factory _$$CurrencyStateImplCopyWith(
    _$CurrencyStateImpl value,
    $Res Function(_$CurrencyStateImpl) then,
  ) = __$$CurrencyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Status getConversionResultStatus,
    ConversionResultModel conversionResult,
  });

  @override
  $StatusCopyWith<$Res> get getConversionResultStatus;
  @override
  $ConversionResultModelCopyWith<$Res> get conversionResult;
}

/// @nodoc
class __$$CurrencyStateImplCopyWithImpl<$Res>
    extends _$CurrencyStateCopyWithImpl<$Res, _$CurrencyStateImpl>
    implements _$$CurrencyStateImplCopyWith<$Res> {
  __$$CurrencyStateImplCopyWithImpl(
    _$CurrencyStateImpl _value,
    $Res Function(_$CurrencyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getConversionResultStatus = null,
    Object? conversionResult = null,
  }) {
    return _then(
      _$CurrencyStateImpl(
        getConversionResultStatus: null == getConversionResultStatus
            ? _value.getConversionResultStatus
            : getConversionResultStatus // ignore: cast_nullable_to_non_nullable
                  as Status,
        conversionResult: null == conversionResult
            ? _value.conversionResult
            : conversionResult // ignore: cast_nullable_to_non_nullable
                  as ConversionResultModel,
      ),
    );
  }
}

/// @nodoc

class _$CurrencyStateImpl implements _CurrencyState {
  _$CurrencyStateImpl({
    required this.getConversionResultStatus,
    required this.conversionResult,
  });

  @override
  final Status getConversionResultStatus;
  @override
  final ConversionResultModel conversionResult;

  @override
  String toString() {
    return 'CurrencyState(getConversionResultStatus: $getConversionResultStatus, conversionResult: $conversionResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyStateImpl &&
            (identical(
                  other.getConversionResultStatus,
                  getConversionResultStatus,
                ) ||
                other.getConversionResultStatus == getConversionResultStatus) &&
            (identical(other.conversionResult, conversionResult) ||
                other.conversionResult == conversionResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getConversionResultStatus, conversionResult);

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      __$$CurrencyStateImplCopyWithImpl<_$CurrencyStateImpl>(this, _$identity);
}

abstract class _CurrencyState implements CurrencyState {
  factory _CurrencyState({
    required final Status getConversionResultStatus,
    required final ConversionResultModel conversionResult,
  }) = _$CurrencyStateImpl;

  @override
  Status get getConversionResultStatus;
  @override
  ConversionResultModel get conversionResult;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
