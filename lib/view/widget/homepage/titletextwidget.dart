import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  final double height;
  const TitleTextWidget({super.key, required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height),
        SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: const TextStyle(
              color: AppColor.praimarycolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
