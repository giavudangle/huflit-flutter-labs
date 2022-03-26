import 'package:flutter/material.dart';
import 'package:huflit_flutter/screen/signup.dart';

class Login extends StatefulWidget {
  static const routeName = "/";
  @override
  State<Login> createState() => _State();
}

class _State extends State<Login> {
  final userName = TextEditingController();
  final password = TextEditingController();

  funcLogin() {
    final strUserName = userName.text.trim();
    final strPassword = password.text.trim();

    if (userName.text.isEmpty || password.text.isEmpty) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text(
                  'Please fill all information $strPassword - $strUserName'),
              actions: [
                TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: Text('OK')),
              ],
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Information'),
              content: Text('Username:$strUserName and Password:$strPassword'),
              actions: [
                TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }

  funcRegister() {
    //comment
    return Navigator.of(context).pushNamed(Register.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/logo.jpg'),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'LOGIN INFORMATION',
                style: TextStyle(color: Colors.lightBlue, fontSize: 30),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: TextField(
                controller: userName,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.account_circle),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.lock,
                    )),
              ),
            ),
            FlatButton(
                onPressed: () {},
                textColor: Colors.blue,
                child: Text('Forgot Password')),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
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
                      onPressed: () {
                        funcRegister();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
