import 'package:flutter/material.dart';
import '../constraints.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
          color: kTextBlackColor,
        ),
        Text(
          label,
          style: kTextStyle
        )
      ],
    );
  }
}
