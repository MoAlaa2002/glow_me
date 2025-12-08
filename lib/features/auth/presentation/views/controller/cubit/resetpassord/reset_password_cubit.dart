import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/features/auth/presentation/data/repo/reset_password_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepoImple})
    : super(InitialResetPassState());
  final ResetPasswordRepoImple resetPasswordRepoImple;
  final TextEditingController email = TextEditingController();
  GlobalKey<FormState> resetkey = GlobalKey();
  resetPass() async {
    try {
      emit(LoadingResetPassState());
      await resetPasswordRepoImple.resetPassword(email: email.text);
      emit(LoadedResetPassState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(FailureResetPassState(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureResetPassState(errormsg: e.code));
      }
    } catch (e) {
      emit(FailureResetPassState(errormsg: e.toString()));
    }
  }

  resetValiate() {
    if (resetkey.currentState!.validate()) {
      resetPass();
    }
  }
}
