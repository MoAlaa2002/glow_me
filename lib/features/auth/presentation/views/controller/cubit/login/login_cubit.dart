import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/core/sharedPrefrances/shred_pref_cache.dart';
import 'package:glow_me/features/auth/presentation/data/repo/login_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepoImple}) : super(InitialLoginState());
  LoginRepoImple loginRepoImple;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey();
  bool isShowPass = false;

  loginWithEmaiAndPassword() async {
    try {
      emit(LoadingLoginState());
      await loginRepoImple.loginWithEmaiAndPassword(
        email: email.text,
        password: password.text,
      );
      await SharedPrefCache.setData(key: 'isLoggedIn', value: true);
      emit(LoadedLoginState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FailureLoginState(errormsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          FailureLoginState(errormsg: 'Wrong password provided for that user.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(FailureLoginState(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureLoginState(errormsg: e.code));
      }
    } catch (e) {
      emit(FailureLoginState(errormsg: e.toString()));
    }
  }

  loginValidate() {
    if (loginKey.currentState!.validate()) {
      loginWithEmaiAndPassword();
    }
  }

  showpass() {
    isShowPass = !isShowPass;
    emit(ShowPassState(value: isShowPass));
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    await SharedPrefCache.setData(key: 'isLoggedIn', value: false);
  }
}
