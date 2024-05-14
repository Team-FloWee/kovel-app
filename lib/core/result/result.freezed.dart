// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<D, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(E error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(E error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<D, E> value) success,
    required TResult Function(Error<D, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<D, E> value)? success,
    TResult? Function(Error<D, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<D, E> value)? success,
    TResult Function(Error<D, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<D, E, $Res> {
  factory $ResultCopyWith(
          Result<D, E> value, $Res Function(Result<D, E>) then) =
      _$ResultCopyWithImpl<D, E, $Res, Result<D, E>>;
}

/// @nodoc
class _$ResultCopyWithImpl<D, E, $Res, $Val extends Result<D, E>>
    implements $ResultCopyWith<D, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<D, E, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<D, E> value, $Res Function(_$SuccessImpl<D, E>) then) =
      __$$SuccessImplCopyWithImpl<D, E, $Res>;
  @useResult
  $Res call({D data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<D, E, $Res>
    extends _$ResultCopyWithImpl<D, E, $Res, _$SuccessImpl<D, E>>
    implements _$$SuccessImplCopyWith<D, E, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<D, E> _value, $Res Function(_$SuccessImpl<D, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<D, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<D, E> implements Success<D, E> {
  const _$SuccessImpl(this.data);

  @override
  final D data;

  @override
  String toString() {
    return 'Result<$D, $E>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<D, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<D, E, _$SuccessImpl<D, E>> get copyWith =>
      __$$SuccessImplCopyWithImpl<D, E, _$SuccessImpl<D, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(E error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(E error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<D, E> value) success,
    required TResult Function(Error<D, E> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<D, E> value)? success,
    TResult? Function(Error<D, E> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<D, E> value)? success,
    TResult Function(Error<D, E> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<D, E> implements Result<D, E> {
  const factory Success(final D data) = _$SuccessImpl<D, E>;

  D get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<D, E, _$SuccessImpl<D, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<D, E, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<D, E> value, $Res Function(_$ErrorImpl<D, E>) then) =
      __$$ErrorImplCopyWithImpl<D, E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<D, E, $Res>
    extends _$ResultCopyWithImpl<D, E, $Res, _$ErrorImpl<D, E>>
    implements _$$ErrorImplCopyWith<D, E, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<D, E> _value, $Res Function(_$ErrorImpl<D, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl<D, E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<D, E> implements Error<D, E> {
  const _$ErrorImpl(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'Result<$D, $E>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<D, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<D, E, _$ErrorImpl<D, E>> get copyWith =>
      __$$ErrorImplCopyWithImpl<D, E, _$ErrorImpl<D, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data) success,
    required TResult Function(E error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data)? success,
    TResult? Function(E error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<D, E> value) success,
    required TResult Function(Error<D, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<D, E> value)? success,
    TResult? Function(Error<D, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<D, E> value)? success,
    TResult Function(Error<D, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<D, E> implements Result<D, E> {
  const factory Error(final E error) = _$ErrorImpl<D, E>;

  E get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<D, E, _$ErrorImpl<D, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
