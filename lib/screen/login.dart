import 'package:flutter/material.dart';
import 'package:huflit_flutter/screen/bottom_navigation_layout.dart';
import 'register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();
  final password = TextEditingController();
  checkLogin(String _userName, String _password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reUsername = prefs.getString('username');
    String? rePassword = prefs.getString('password');
    if (reUsername == _userName && rePassword == _password) return true;
    return false;
  }

  funcLogin() async {
    final strUserName = userName.text;
    final strPassword = password.text;
    // get info from sharereference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reUsername = prefs.getString('username');
    String? rePassword = prefs.getString('password');
    //
    if (strUserName == reUsername && strPassword == rePassword) {
      Navigator.of(context).pushReplacementNamed(BottomNavigationLayout.routeName);
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Username or password is not correct.'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    }
  }

  funcRegister() {
    return Navigator.of(context).pushNamed(RegisterNewScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset(
                'assets/logo.jpg',
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                'LOGIN INFORMATION',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: userName,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'User Name', suffixIcon: Icon(Icons.account_circle)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(onPressed: () {}, textColor: Colors.blue, child: Text('Forgot Password')),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                child: Text('Login'),
                onPressed: () {
                  funcLogin();
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  TextButton(
                    child: Text(
                      ' Sign in',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      funcRegister();
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
