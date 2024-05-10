import 'package:flutter/cupertino.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class ArchivedViewModel with ChangeNotifier {
  UserRepository _userRepository;

  ArchivedViewModel({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;
}
