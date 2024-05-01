import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/text_button.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class AccountMainPage extends RoutableView<AccountMainViewModel> {
  AccountMainPage({super.key, required super.viewModel});

  Widget _createHeaderSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: media.size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.lightBlue,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyles.textStyle2,
                    ),
                    Text(
                      "John Doe",
                      style: TextStyles.textStyle1,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              MainTextButton(
                  label: "Sign In",
                  onPressed: () => viewModel.router?.goLogin()),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.grey.shade300,
        width: media.size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _createHeaderSection(),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: media.size.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.redAccent.shade100,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.pages,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Premium Membership",
                      style: TextStyles.textStyle1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MainTextButton(label: "My Cloud", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(label: "Categories", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(
                label: "Security",
                onPressed: () {},
                backgroundColor: Colors.grey.shade500,
              ),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(
                  label: "Share", onPressed: () => viewModel.share()),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(label: "Rate Us", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(label: "Support", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(
                  label: "Settings", onPressed: () => viewModel.openSettings()),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(label: "Privacy Policy", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              MainTextButton(label: "Terms and Condition", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Nov Pocket 1.0.0",
                  style: TextStyles.textStyle3,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
