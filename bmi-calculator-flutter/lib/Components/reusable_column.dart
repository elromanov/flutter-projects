import 'package:flutter/material.dart';
import '../constants.dart';

const double iconSize = 80;
const double sizedBoxHeight = 15;

class ReusableColumn extends StatelessWidget {
  ReusableColumn({@required this.icon, @required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(title, style: kLabelStyle,)
      ],
    );
  }
}