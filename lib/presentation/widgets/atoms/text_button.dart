import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final void Function() onPressed;

  const MainTextButton(
      {required this.label,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.pinkAccent,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          // backgroundColor: Colors.black45
        ),
      ),
    );
  }
}
