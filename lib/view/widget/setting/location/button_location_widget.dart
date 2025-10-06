import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class ButtonLocationWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const ButtonLocationWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.praimarycolor,
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: SizedBox(
              width: double.infinity,
              child: Text(text, textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }
}
