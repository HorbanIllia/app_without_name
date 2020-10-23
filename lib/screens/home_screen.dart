import 'package:app_without_name/screens/account_h_screen.dart';
import 'package:app_without_name/screens/home_h_screen.dart';
import 'package:app_without_name/screens/map_h_screen.dart';
import 'package:app_without_name/screens/myemergency_h_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [HomeHWidget(),MyEmergencyHScreen(),MapHScreen(),AccountHWidget()],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.yellowAccent, Colors.redAccent],
          ),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.black45,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text("My List")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text("Map")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Account")
            ),
          ],
        ),
      ),
    );
  }
}
