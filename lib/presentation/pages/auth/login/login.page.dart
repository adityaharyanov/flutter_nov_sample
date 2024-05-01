import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:flutter_nov_trial/presentation/pages/auth/login/login.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/text_button.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class LoginPage extends RoutableView<LoginViewModel> {
  LoginPage({super.key, required super.viewModel});

  Widget _textField(
      String hint, String title, Function(String value) onTextChanged) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.textStyle1,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(
                    BorderSide(width: 2, color: Colors.black))),
            height: 50,
            child: TextField(
              onChanged: onTextChanged,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
      appBar: SimpleAppBar.create(context, titleText: ""),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 150,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _textField(
                      "john@doe.com", "Input Email", viewModel.onChangeEmail),
                  const SizedBox(
                    height: 20,
                  ),
                  _textField(
                      "password", "Input Password", viewModel.onChangePassword),
                  const SizedBox(
                    height: 40,
                  ),
                  MainTextButton(
                    label: "Sign In",
                    onPressed: () => viewModel.signIn(),
                    backgroundColor: Colors.blueAccent,
                  ),
                  TextButton(
                      onPressed: () => viewModel.forgotPassword(),
                      child: const Text("Forgot Password")),
                  MainTextButton(
                    label: "Register",
                    onPressed: () => viewModel.router?.goRegister(),
                    backgroundColor: Colors.pink,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
