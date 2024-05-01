import 'package:flutter/material.dart';

class IconTextOutlinedButton extends StatelessWidget {
  final IconData icon;
  final String text;
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
  IconTextOutlinedButton(
      {required this.icon,
      required this.text,
      this.isSelected = false,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: isSelected ? _selectedStyle : _normalStyle,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
                // backgroundColor: Colors.black45
              ),
            ),
          ]),
        ));
  }
}
