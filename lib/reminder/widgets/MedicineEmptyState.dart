import 'package:flutter/material.dart';
import 'package:joyus_app/reminder/animations/fade_animation.dart';


class MedicineEmptyState extends StatelessWidget {
  const MedicineEmptyState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      .5,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/emergency.png',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            'ยังไม่มียาที่ถูกเพิ่ม',
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 20, letterSpacing: 1.2,fontFamily: 'supermarket',),
          )
        ],
      ),
    );
  }
}
