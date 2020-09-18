// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwsocialchat/chat.dart';
import 'package:lwsocialchat/home.dart';
import 'package:lwsocialchat/login.dart';
import 'package:lwsocialchat/reg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "reg": (context) => MyReg(),
      "login": (context) => MyLogin(),
      "chat": (context) => MyChat(),
    },
  ));
}
