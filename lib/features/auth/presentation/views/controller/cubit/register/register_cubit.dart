import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/features/auth/presentation/data/repo/register_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepoImple})
    : super(InitialRegisterSate());
  final RegisterRepoImple registerRepoImple;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  String? confirmPasswordError;
  bool value = false;
  bool isShowPass = false;
  final GlobalKey<FormState> keyRegister = GlobalKey();
  signInWithEmailAndPass() async {
    emit(LoadingRegisterSate());
    try {
      await registerRepoImple.signUpWiteEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await verifyEmail();
      emit(LoadedRegisterSate());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          FailureRegisterSate(errormsg: "The password provided is too weak."),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          FailureRegisterSate(
            errormsg: "The account already exists for that email.",
          ),
        );
      } else if (e.code == 'invalid-email') {
        emit(FailureRegisterSate(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureRegisterSate(errormsg: e.code));
        print(e.code);
      }
    } catch (e) {
      emit(FailureRegisterSate(errormsg: e.toString()));
    }
  }

  void registerValidate() {
    if (keyRegister.currentState!.validate()) {
      signInWithEmailAndPass();
    }
  }

  bool confirmPass() {
    if (password.text != confirmPassword.text) {
      confirmPasswordError = 'Passwords do not match!'.trim();
      emit(InitialRegisterSate());
      return false;
    } else {
      confirmPasswordError = null;
      return true;
    }
  }

  temsAndCondtions(newValue) {
    value = newValue;
    emit(TermsAndConditionsState(value: newValue));
  }

  showpass() {
    isShowPass = !isShowPass;
    emit(ShowPassState(value: isShowPass));
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser?.reload();
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> close() {
    email.dispose();
    name.dispose();
    password.dispose();
    phonenumber.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}
