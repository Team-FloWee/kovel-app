import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/tour.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userId,
    required String name,
    required String email,
    required String imageUrl,
    required List<Archived> archivedList,
    //Todo 보관함,배낭톡,일정
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
