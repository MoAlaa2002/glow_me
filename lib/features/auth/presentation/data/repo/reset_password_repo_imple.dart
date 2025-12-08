import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepoImple {
  final FirebaseAuth firebaseAuth;
  ResetPasswordRepoImple({required this.firebaseAuth});
  resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
