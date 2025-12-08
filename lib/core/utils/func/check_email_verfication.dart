import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glow_me/core/utils/func/snakBar.dart';

Future<bool> checkEmailVerification(BuildContext context) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;
    print("✅ Email Verified: ${user?.emailVerified}");

    if (user != null && user.emailVerified) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    snackBar(msg: "Something went wrong: $e", context: context);
    return false;
  }
}
