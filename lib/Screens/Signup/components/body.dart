import 'package:flutter/material.dart';
import 'package:joyus_app/Screens/Login/login_screen.dart';
import 'package:joyus_app/Screens/Signup/components/background.dart';
import 'package:joyus_app/Screens/Signup/components/or_divider.dart';
import 'package:joyus_app/Screens/Signup/components/social_icon.dart';
import 'package:joyus_app/components/already_have_an_account_acheck.dart';
import 'package:joyus_app/components/rounded_button.dart';
import 'package:joyus_app/components/rounded_input_field.dart';
import 'package:joyus_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';
import '../../../home_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Text(
                "สมัครสมาชิก",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),

              TextFormField(
                validator: (input) {
                  if (input.isEmpty) return 'กรุณาระบุชื่อผู้ใช้งาน';
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'อีเมล',
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    border: InputBorder.none),
              ),
              // RoundedInputField(
              //   hintText: "Your Email",
              //   onChanged: (value) {},
              // ),

              SizedBox(
                height: 10.0,
              ),

              TextFormField(
                validator: (input) {
                  if (input.isEmpty) return 'กรุณาระบุรหัสผ่าน';
                },
                onSaved: (input) => _password = input,

                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'รหัสผ่าน',
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    border: InputBorder.none),
              ),

              // RoundedPasswordField(
              //   onChanged: (value) {},
              // ),

              RoundedButton(
                text: "สมัครสมาชิก",
                press: signUp
                //() {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
