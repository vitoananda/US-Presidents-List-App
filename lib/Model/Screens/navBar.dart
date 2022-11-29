import 'package:flutter/material.dart';
import 'package:project_pam/Model/Screens/Profile.dart';
import 'package:project_pam/Model/Screens/presidentList.dart';

class NavBarPage extends StatefulWidget {

  @override
  _NavBarPageState createState() => _NavBarPageState();
}
class _NavBarPageState extends State<NavBarPage> {
  @override

  int _selectedTabIndex = 0;
  void _onNavBarTapped (int index){
    setState((){
      _selectedTabIndex = index;
    });
  }

  Widget build(BuildContext context) {

    final _listpage = <Widget>[
      Home(),
      ProfilePage(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: new Icon(Icons.home,),
          label: 'Home Page'
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.account_circle,),
        label: 'Profile',
      ),
    ];

    final _bottomNavbar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      backgroundColor: Color(0xff0660a9),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontFamily: 'Montserrat'),
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _listpage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavbar,
    );

  }
}