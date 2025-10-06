import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class RowButtomWidget extends StatelessWidget {
  final String text;
  final String buttontext;
  final Function() onPressed;
  const RowButtomWidget({
    super.key,
    required this.text,
    required this.buttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 5, child: Text(text, textAlign: TextAlign.center)),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  buttontext,
                  style: const TextStyle(color: AppColor.praimarycolor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
