import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImple {
  final FirebaseAuth firebaseAuth;
  RegisterRepoImple({required this.firebaseAuth});
  Future<UserCredential> signUpWiteEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
