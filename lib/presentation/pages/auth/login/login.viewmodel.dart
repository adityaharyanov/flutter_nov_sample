import 'package:get/get.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/login/login.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class LoginViewModel extends RoutableViewModel<LoginRouter> {
  RxString inputEmail = "".obs;

  RxString inputPassword = "".obs;

  LoginViewModel();

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  void onChangeEmail(String value) {
    inputEmail.value = value;
  }

  void onChangePassword(String value) {
    inputPassword.value = value;
  }

  signIn() {}

  forgotPassword() {
    router?.goForgotPassword();
  }
}
