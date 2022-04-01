import 'package:flutter/material.dart';
import 'package:huflit_flutter/screen/bottom_navigation_layout.dart';
import 'package:huflit_flutter/screen/register.dart';
import 'package:huflit_flutter/screen/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: LoginScreen(),
      routes: {
        // LoginScreen.routeName: (ctx) => LoginScreen(),
        BottomNavigationLayout.routeName: (ctx) => BottomNavigationLayout(),
        RegisterNewScreen.routeName: (ctx) => RegisterNewScreen(),
      },
    ));
