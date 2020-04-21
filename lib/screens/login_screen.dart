import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widget/RoundedButton.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


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
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration("Enter your e-mail"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration("Enter your password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent, text: "Login",
                onPressed: () async{

              showDialog(context: context, builder: (ctx){
                return Container(child: Center(child: CircularProgressIndicator(),),);
              });

              try{
                final _result = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);

                if(_result != null){
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
