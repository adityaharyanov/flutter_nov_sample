import 'package:flutter_nov_trial/presentation/pages/auth/register/register.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class RegisterViewModel extends RoutableViewModel<RegisterRouter> {
  String inputEmail = "";

  String inputPassword = "";

  String inputConfirmPassword = "";

  String inputConfirmationPassword = "";

  String inputPhoneNo = "";

  String inputFirstName = "";

  String inputLastName = "";

  String inputBirthday = "";

  RegisterViewModel();

  register() {}

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
