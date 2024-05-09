import 'package:firebase_auth/firebase_auth.dart' as auth;

class CurrentUserService {
  final currentUser = auth.FirebaseAuth.instance.currentUser;

  String getUserId() {
    if (currentUser != null) {
      return currentUser!.uid;
    } else {
      return '';
    }
  }
}
