import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: MyChat(),
  ));
}

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var fconnect = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;
  var mess;
  var control = TextEditingController();

  signout() async {
    await authc.signOut();
    Navigator.pushNamed(context, 'login');
  }

  showcurrentuser() async {
    var user = authc.currentUser.email;
    print(user);
  }

  getMessage() async {
    await for (var i in fconnect.collection("chat").snapshots()) {
      for (var doc in i.docs) {
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Page"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("current user"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Logout"),
                value: 2,
              )
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Container(
          //   child: Text("space"),
          //   color: Colors.grey,
          //   width: double.infinity,
          //   height: devicewidth * 0.8,
          // ),
          FlatButton(onPressed: () => signout(), child: Text('Logout')),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  mess = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter your message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onPressed: () async {
                    control.clear();
                    await fconnect.collection('chat').add({
                      "sender": authc.currentUser.email,
                      "message": mess,
                    });
                    print(mess);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
