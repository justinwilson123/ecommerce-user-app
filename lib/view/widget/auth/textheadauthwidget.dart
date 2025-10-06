import 'package:flutter/material.dart';

class TextHeadauthWidget extends StatelessWidget {
  final String headtext;
  final String bodytext;
  final double height;
  const TextHeadauthWidget({
    super.key,
    required this.headtext,
    required this.bodytext,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headtext,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          bodytext,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: height,
        )
      ],
    );
  }
}
