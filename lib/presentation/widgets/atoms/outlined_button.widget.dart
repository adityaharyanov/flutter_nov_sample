import 'package:flutter/material.dart';

class MainOutlinedButton extends StatelessWidget {
  final String? topText;
  final String? bottomText;
  final bool isSelected;
  final void Function()? onTap;

  final ButtonStyle _normalStyle = OutlinedButton.styleFrom(
    side: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
    padding: EdgeInsets.all(5),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  final ButtonStyle _selectedStyle = OutlinedButton.styleFrom(
    side: BorderSide(
      color: Colors.blue,
      width: 3,
    ),
    padding: EdgeInsets.all(5),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  MainOutlinedButton(
      {this.topText,
      this.bottomText,
      this.isSelected = false,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: isSelected ? _selectedStyle : _normalStyle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (topText != null)
                  Text(
                    topText ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                if (bottomText != null)
                  Text(
                    bottomText ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
              ]),
        ));
  }
}
