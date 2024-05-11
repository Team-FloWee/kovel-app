import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kovel_app/core/auth/current_user_service.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/auth/social_auth.dart';

class GoogleAuth implements SocialAuth {
  @override
  Future<User?> login() async {
    // Trigger the authentication flow
    await logout();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userId = CurrentUserService().currentUser!.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore
        .collection('user')
        .doc(userId)
        .get()
        .then((value) => value.data());
    print('구글어스데이타콘솔$data');
    // Once signed in, return the UserCredential
    try {
      final userCredential =
          await auth.FirebaseAuth.instance.signInWithCredential(credential);

      final user = User(
        userId: userCredential.user!.uid,
        name: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        imageUrl: userCredential.user!.photoURL ?? '',
        archivedList: [],
        stringList: User.fromJson(data as Map<String, dynamic>).stringList,
      );
      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
  }
}
