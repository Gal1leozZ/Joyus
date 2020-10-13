import 'package:flutter/material.dart';
import 'package:joyus_app/constants.dart';

class Button extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  final bool isPrimary;

  Button.primary({
    @required this.buttonLabel,
    @required this.onPressed,
  }) : isPrimary = true;

  Button.accent({
    @required this.buttonLabel,
    @required this.onPressed,
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: isPrimary ? kPrimaryColor : kPrimaryLightColor,
      shape: isPrimary
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).disabledColor,
              ),
            ),
      child: Text(
        buttonLabel,
        style: isPrimary
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )
            : TextStyle(
                fontWeight: FontWeight.w700,
              ),
      ),
      onPressed: onPressed,
    );
  }
}
