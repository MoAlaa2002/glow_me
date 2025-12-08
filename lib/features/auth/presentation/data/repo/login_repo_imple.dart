import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImple {
  FirebaseAuth firebaseAuth;
  LoginRepoImple({required this.firebaseAuth});
  Future<UserCredential> loginWithEmaiAndPassword({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
