import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.texto,
    @required this.sender,
    @required this.current,
  }) : super(key: key);

  final String texto;
  final String sender;
  final String current;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: current==sender?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender, style: TextStyle(fontSize: 12, color: Colors.black45),),
          Material(borderRadius:current==sender? BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)) : BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            elevation: 5,
            color: current==sender?Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(texto,
                style: TextStyle(color:current==sender?Colors.white:Colors.black, fontSize: 16),),
            ),

          )
        ],
      ),
    );
  }
}
