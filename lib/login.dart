import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

main() {
  runApp(MaterialApp(
    home: MyLogin(),
  ));
}

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;
  String email, pass;
  bool sspin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
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
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: "Your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    onPressed: () {
                      sspin = true;
                      try {
                        var user = authc.signInWithEmailAndPassword(
                            email: email, password: pass);
                        print(user);
                        if (user != null) {
                          Navigator.pushNamed(context, "chat");
                          setState(() {
                            sspin = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Colors.blue,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
