// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archived.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Archived _$ArchivedFromJson(Map<String, dynamic> json) {
  return _Archived.fromJson(json);
}

/// @nodoc
mixin _$Archived {
  int get id => throw _privateConstructorUsedError;
  int get contentType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get mapx => throw _privateConstructorUsedError;
  String get mapy => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArchivedCopyWith<Archived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchivedCopyWith<$Res> {
  factory $ArchivedCopyWith(Archived value, $Res Function(Archived) then) =
      _$ArchivedCopyWithImpl<$Res, Archived>;
  @useResult
  $Res call(
      {int id,
      int contentType,
      String title,
      String mapx,
      String mapy,
      String imagePath,
      String tel});
}

/// @nodoc
class _$ArchivedCopyWithImpl<$Res, $Val extends Archived>
    implements $ArchivedCopyWith<$Res> {
  _$ArchivedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contentType = null,
    Object? title = null,
    Object? mapx = null,
    Object? mapy = null,
    Object? imagePath = null,
    Object? tel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mapx: null == mapx
          ? _value.mapx
          : mapx // ignore: cast_nullable_to_non_nullable
              as String,
      mapy: null == mapy
          ? _value.mapy
          : mapy // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArchivedImplCopyWith<$Res>
    implements $ArchivedCopyWith<$Res> {
  factory _$$ArchivedImplCopyWith(
          _$ArchivedImpl value, $Res Function(_$ArchivedImpl) then) =
      __$$ArchivedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int contentType,
      String title,
      String mapx,
      String mapy,
      String imagePath,
      String tel});
}

/// @nodoc
class __$$ArchivedImplCopyWithImpl<$Res>
    extends _$ArchivedCopyWithImpl<$Res, _$ArchivedImpl>
    implements _$$ArchivedImplCopyWith<$Res> {
  __$$ArchivedImplCopyWithImpl(
      _$ArchivedImpl _value, $Res Function(_$ArchivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contentType = null,
    Object? title = null,
    Object? mapx = null,
    Object? mapy = null,
    Object? imagePath = null,
    Object? tel = null,
  }) {
    return _then(_$ArchivedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mapx: null == mapx
          ? _value.mapx
          : mapx // ignore: cast_nullable_to_non_nullable
              as String,
      mapy: null == mapy
          ? _value.mapy
          : mapy // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArchivedImpl implements _Archived {
  const _$ArchivedImpl(
      {required this.id,
      required this.contentType,
      required this.title,
      required this.mapx,
      required this.mapy,
      required this.imagePath,
      required this.tel});

  factory _$ArchivedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchivedImplFromJson(json);

  @override
  final int id;
  @override
  final int contentType;
  @override
  final String title;
  @override
  final String mapx;
  @override
  final String mapy;
  @override
  final String imagePath;
  @override
  final String tel;

  @override
  String toString() {
    return 'Archived(id: $id, contentType: $contentType, title: $title, mapx: $mapx, mapy: $mapy, imagePath: $imagePath, tel: $tel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchivedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mapx, mapx) || other.mapx == mapx) &&
            (identical(other.mapy, mapy) || other.mapy == mapy) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.tel, tel) || other.tel == tel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, contentType, title, mapx, mapy, imagePath, tel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchivedImplCopyWith<_$ArchivedImpl> get copyWith =>
      __$$ArchivedImplCopyWithImpl<_$ArchivedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchivedImplToJson(
      this,
    );
  }
}

abstract class _Archived implements Archived {
  const factory _Archived(
      {required final int id,
      required final int contentType,
      required final String title,
      required final String mapx,
      required final String mapy,
      required final String imagePath,
      required final String tel}) = _$ArchivedImpl;

  factory _Archived.fromJson(Map<String, dynamic> json) =
      _$ArchivedImpl.fromJson;

  @override
  int get id;
  @override
  int get contentType;
  @override
  String get title;
  @override
  String get mapx;
  @override
  String get mapy;
  @override
  String get imagePath;
  @override
  String get tel;
  @override
  @JsonKey(ignore: true)
  _$$ArchivedImplCopyWith<_$ArchivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
