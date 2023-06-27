import 'package:flutter/material.dart';
import '../constants.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

      onPressed: onPress,
      child: Icon(icon),

    );
  }
}