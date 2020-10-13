import 'package:flutter/material.dart';
import 'package:joyus_app/Screens/Login/components/background.dart';
import 'package:joyus_app/Screens/Signup/signup_screen.dart';
import 'package:joyus_app/components/already_have_an_account_acheck.dart';
import 'package:joyus_app/components/rounded_button.dart';
import 'package:joyus_app/components/rounded_input_field.dart';
import 'package:joyus_app/components/rounded_password_field.dart';
import 'package:joyus_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joyus_app/home/hometwo.dart';
import 'package:joyus_app/home_screen.dart';
import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  

  // Future<List> login() async{
  //   final response = await http.post("localhost/user/users")
  // }

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
                "เข้าสู่ระบบ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              // RoundedInputField(
              //   hintText: "Your Email",
              //   onChanged: (String getUsername1) {
              //     getUsername = getUsername1;
              //   },
              // ),

              TextFormField(
                validator: (input){
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

              SizedBox(
                height: 10.0,
              ),

              TextFormField(
                validator: (input){
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
              //   onChanged: (ctrlPassword) {},
              // ),
              RoundedButton(text: "เข้าสู่ระบบ", press: signIn
              // () {}
                  // {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return Homescreen();
                  //       },
                  //     ),
                  //   );
                  // },
                  ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen_Two()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  // doLogin() {
  //   if (_formKey.currentState.validate()) {
  //     String username = ctrlUsername.text;
  //     String password = ctrlPassword.text;

  //     if (username == 'admin' && password == 'admin') {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return Homescreen();
  //           },
  //         ),
  //       );
  //     } else {
  //       return 'ข้อมูลไม่ถูกต้อง';
  //     }
  //   }
  // }
}
