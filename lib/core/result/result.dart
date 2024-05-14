import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<D, E> with _$Result<D, E> {
const factory Result.success(D data) = Success<D, E>;
const factory Result.error(E error) = Error<D, E>;
}