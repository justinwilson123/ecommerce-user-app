import 'package:flutter/material.dart';

class ButtonBottomNavigtionBarWidget extends StatelessWidget {
  // final String text;
  final IconData iconData;
  final void Function()? onPressed;
  final Color color;
  const ButtonBottomNavigtionBarWidget(
      {super.key,
      // required this.text,
      required this.onPressed,
      required this.iconData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          // Text(
          //   text,
          //   style: TextStyle(color: color, fontSize: 10),
          // ),
        ],
      ),
    );
  }
}
