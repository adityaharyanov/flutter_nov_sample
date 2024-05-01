import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/register/register.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/simple_app_bar.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/text_button.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class RegisterPage extends RoutableView<RegisterViewModel> {
  RegisterPage({super.key, required super.viewModel});
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
      appBar: SimpleAppBar.create(context, titleText: "Register"),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.account_box,
                size: 150,
              ),
              _textField("john@doe.com", "Input Email",
                  (value) => {viewModel.inputEmail = value}),
              const SizedBox(
                height: 10,
              ),
              _textField("Password", "Input Password",
                  (value) => {viewModel.inputPassword = value}),
              const SizedBox(
                height: 10,
              ),
              _textField("confirmation password", "Input Confirmation Password",
                  (value) => {viewModel.inputConfirmPassword = value}),
              const SizedBox(
                height: 10,
              ),
              _textField("6289412xxx", "Input Phone No",
                  (value) => {viewModel.inputPhoneNo = value}),
              const SizedBox(
                height: 10,
              ),
              _textField("john", "Input First Name",
                  (value) => {viewModel.inputFirstName = value}),
              const SizedBox(
                height: 10,
              ),
              _textField("doe", "Input Last Name",
                  (value) => {viewModel.inputLastName = value}),
              _textField("14-12-2024", "Choose Birthday",
                  (value) => {viewModel.inputBirthday = value}),
              const SizedBox(
                height: 30,
              ),
              MainTextButton(
                  label: "Register", onPressed: () => viewModel.register())
            ],
          ),
        ),
      ),
    ));
  }
}
