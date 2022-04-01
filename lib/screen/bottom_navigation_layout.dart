import 'package:flutter/material.dart';
import 'package:huflit_flutter/screen/dashboard_fragment.dart';
import 'info_fragment.dart';
import 'home_fragment.dart';
import 'logout_fragment.dart';
import 'package:huflit_flutter/screen/notification_fragment.dart';

class BottomNavigationLayout extends StatefulWidget {
  static const routeName = "bottom-layout";
  @override
  _BottomNavigationLayoutState createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  bodyWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeFragmentWidget();
      case 1:
        return DashboardFragmentWidget();
      case 2:
        return InfoFragmentWidget();
      case 3:
        return LogoutFragmentWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bottom Navigation'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: Colors.blue,
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.blue,
              ),
              label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_run,
                color: Colors.blue,
              ),
              label: 'Logout'),
        ],
      ),
      body: bodyWidget(_currentIndex),
    );
  }
}
