import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwsocialchat/reg.dart';

main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
                  },
                  color: Colors.blue,
                  child: Text("Login"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  onPressed: () {
                    Navigator.pushNamed(context, "reg");
                  },
                  color: Colors.blue,
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
