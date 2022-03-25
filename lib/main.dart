import 'package:flutter/material.dart';
import 'screen/signup.dart';
import 'screen/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: Login(),
      routes: {
        Register.routeName: (context) => Register(),
      },
    ));
