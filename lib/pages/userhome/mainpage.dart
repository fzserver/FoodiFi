import 'package:flutter/material.dart';
import 'package:foodifi/pages/subscriptionpage.dart';
import 'package:foodifi/pages/userProfile/userProfile.dart';

import '../favourite.dart';
import 'userhome.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    UserHomePage(),
    SubscriptionPage(),
    UserProfile(),
    Favourite()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          /*  showSelectedLabels: false,
      showUnselectedLabels: false,*/
          items: [
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.home, color: Colors.black),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.location_on, color: Colors.black),
            ),
            /* BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.add, color: Colors.black),
            ),*/
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.person_outline, color: Colors.black),
            ),
          ],
        ),
      );
}
