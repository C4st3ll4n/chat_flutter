import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Message.dart';

class MessageStream extends StatelessWidget {

  final Firestore store;
  final String current;

  const MessageStream({Key key, this.store, this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: store.collection("messages").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data.documents.reversed;
            List<Message> msgsWidgets = [];
            for (var msg in messages) {
              final texto = msg.data['text'];
              final sender = msg.data['sender'];

              msgsWidgets.add(Message(texto: texto, sender: sender, current: current,));
            }
            return ListView(children: msgsWidgets,);
          } else {

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else
              return Card(
                child: ListTile(
                  title: Text("NO MESSAGES"),
                ),
              );
          }
        },
      ),
    );
  }
}
