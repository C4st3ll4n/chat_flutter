import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widget/RoundedButton.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: 'images/logo.png',
                      child: Image.asset('images/logo.png')),
                  height: 60.0,
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent, text: "Login", onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
    }),
            RoundedButton(color: Colors.blueAccent, text: "Register", onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
