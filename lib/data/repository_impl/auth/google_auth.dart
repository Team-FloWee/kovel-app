import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/auth/social_auth.dart';

class GoogleAuth implements SocialAuth {
  @override
  Future<User?> login() async {
    // Trigger the authentication flow
    await GoogleSignIn().disconnect();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      final userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credential);

      final user = User(
          userId: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          imageUrl: userCredential.user!.photoURL ?? ''
      );
      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    return false;
  }
}

