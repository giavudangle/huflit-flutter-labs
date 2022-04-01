import 'package:flutter/material.dart';
import 'package:huflit_flutter/screen/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoFragmentWidget extends StatefulWidget {
  const InfoFragmentWidget({Key? key}) : super(key: key);

  @override
  State<InfoFragmentWidget> createState() => _InfoFragmentWidgetState();
}

class _InfoFragmentWidgetState extends State<InfoFragmentWidget> {
  late var objuser = User("", "", "", "");
  void funcgetInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reFirstName = prefs.getString('firstname');
    String? reLastName = prefs.getString('lastname');
    String? reUsername = prefs.getString('username');
    String? rePassword = prefs.getString('password');
    setState(() {
      objuser = User(reFirstName!, reLastName!, reUsername!, rePassword!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    funcgetInfo();

    // dbHelper = DBHelper();
    // dbHelper.copyDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Information'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            SizedBox(
              width: 70,
              height: 70,
              child: Image.asset(
                'assets/account.png',
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                'USER INFORMATION',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'First name: ' + objuser.firstname,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Last name: ' + objuser.lastname,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'User name: ' + objuser.username,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Passsword: ' + objuser.password,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
