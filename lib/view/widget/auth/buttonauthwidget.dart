import 'package:flutter/material.dart';

class ButtonAuthWidget extends StatelessWidget {
  final String buttontext;
  final Color? buttoncolor;
  final Color textbuttoncolor;
  final double horizontal;
  final double vertiacl;
  final double radius;
  final Function() onPressed;
  const ButtonAuthWidget({
    super.key,
    required this.buttontext,
    this.buttoncolor,
    required this.textbuttoncolor,
    required this.horizontal,
    required this.vertiacl,
    required this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertiacl,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: buttoncolor,
        ),
        child: Text(
          buttontext,
          style: TextStyle(color: textbuttoncolor),
        ),
      ),
    );
  }
}
