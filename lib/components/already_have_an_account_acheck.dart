import 'package:flutter/material.dart';
import 'package:joyus_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "ยังไม่มีบัญชีผู้ใช้ ? " : "มีบัญชีผู้ใช้แล้ว ? ",
          style: TextStyle(fontSize: 15, color: kPrimaryColor),
          
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "สมัครสมาชิก" : "ล็อกอิน",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
