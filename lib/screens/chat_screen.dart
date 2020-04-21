import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/widget/Message.dart';
import 'package:flash_chat/widget/MessageStream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _msgController = TextEditingController();

  FirebaseUser _loggedUser;
  Firestore _store = Firestore.instance;
  List msgs = [];

  String messageText;

  void getCurrentUser() async {
    final FirebaseUser _user = await _auth.currentUser();
    if (_user != null) _loggedUser = _user;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              store: _store,
              current: _loggedUser.email,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _msgController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _msgController.clear();
                      _store.collection("messages").add(
                          {"text": messageText, "sender": _loggedUser.email});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
