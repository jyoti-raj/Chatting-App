import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: MyReg(),
  ));
}

class MyReg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<MyReg> {
  var x = FirebaseAuth.instance;
  String email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autocorrect: false,
                onChanged: (value) => {email = value},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autocorrect: false,
                onChanged: (value) => {pass = value},
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: "Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: () async {
                    var user = await x.createUserWithEmailAndPassword(
                        email: email, password: pass);
                    print(email);
                    print(pass);
                    print(user);
                    Navigator.pushNamed(context, "home");
                  },
                  color: Colors.blue,
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
