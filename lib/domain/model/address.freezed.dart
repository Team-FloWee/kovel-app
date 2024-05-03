// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  NewAddress get roadAddress => throw _privateConstructorUsedError;
  OldAddress get oldAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({NewAddress roadAddress, OldAddress oldAddress});

  $NewAddressCopyWith<$Res> get roadAddress;
  $OldAddressCopyWith<$Res> get oldAddress;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roadAddress = null,
    Object? oldAddress = null,
  }) {
    return _then(_value.copyWith(
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as NewAddress,
      oldAddress: null == oldAddress
          ? _value.oldAddress
          : oldAddress // ignore: cast_nullable_to_non_nullable
              as OldAddress,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewAddressCopyWith<$Res> get roadAddress {
    return $NewAddressCopyWith<$Res>(_value.roadAddress, (value) {
      return _then(_value.copyWith(roadAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OldAddressCopyWith<$Res> get oldAddress {
    return $OldAddressCopyWith<$Res>(_value.oldAddress, (value) {
      return _then(_value.copyWith(oldAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewAddress roadAddress, OldAddress oldAddress});

  @override
  $NewAddressCopyWith<$Res> get roadAddress;
  @override
  $OldAddressCopyWith<$Res> get oldAddress;
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roadAddress = null,
    Object? oldAddress = null,
  }) {
    return _then(_$AddressImpl(
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as NewAddress,
      oldAddress: null == oldAddress
          ? _value.oldAddress
          : oldAddress // ignore: cast_nullable_to_non_nullable
              as OldAddress,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({required this.roadAddress, required this.oldAddress});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final NewAddress roadAddress;
  @override
  final OldAddress oldAddress;

  @override
  String toString() {
    return 'Address(roadAddress: $roadAddress, oldAddress: $oldAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.roadAddress, roadAddress) ||
                other.roadAddress == roadAddress) &&
            (identical(other.oldAddress, oldAddress) ||
                other.oldAddress == oldAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roadAddress, oldAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {required final NewAddress roadAddress,
      required final OldAddress oldAddress}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  NewAddress get roadAddress;
  @override
  OldAddress get oldAddress;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
