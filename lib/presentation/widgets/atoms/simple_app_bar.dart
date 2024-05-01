import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/router/navigator.dart';

class SimpleAppBar extends AppBar with BaseNavigator {
  SimpleAppBar({super.key});

  Widget? _createLeftButton(
      BuildContext context, LeftButtonType? leftButtonType) {
    if (leftButtonType == null) {
      return null;
    }

    IconData leftButtonIcon;

    switch (leftButtonType) {
      case LeftButtonType.back:
        leftButtonIcon = Icons.arrow_back;
        break;
      default:
        leftButtonIcon = Icons.close;
        break;
    }

    return InkWell(
      onTap: () {
        pop();
      },
      child: Icon(
        leftButtonIcon,
        color: Colors.black54,
      ),
    );
  }

  static AppBar create(BuildContext context,
      {required String titleText, LeftButtonType? leftButtonType}) {
    var appBar = SimpleAppBar();
    appBar.context = context;
    return AppBar(
      backgroundColor: const Color.fromRGBO(68, 138, 255, 1),
      title: Text(titleText),
      leading: appBar._createLeftButton(context, leftButtonType),
    );
  }
}

enum LeftButtonType {
  close,
  back,
}
