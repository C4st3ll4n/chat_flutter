import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widget/RoundedButton.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email;
  String password;

  final _auth = FirebaseAuth.instance;

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
            Container(
              height: 200.0,
              child: Hero(tag: 'images/logo.png',
              child: Image.asset('images/logo.png')),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              decoration:kTextFieldDecoration("Enter your email"),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration("Enter your password"),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(color: Colors.blueAccent, text: "Register",
                onPressed: () async {

                  showDialog(context: context, builder: (ctx){
                    return Container(child: Center(child: CircularProgressIndicator(),),);
                  });

              try {
                final AuthResult _user = await _auth
                    .createUserWithEmailAndPassword(
                    email: email, password: password);

                if(_user != null){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ChatScreen.id);
                }
              }catch(e){
                Navigator.pop(context);
                print(e);
              }
            }),
          ],
        ),
      ),
    );
  }
}
