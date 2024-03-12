import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/Main/bottomTabs/homepage.dart';
import 'package:nutriapp/Screens/Main/bottomTabs/nutriibot.dart';
import 'package:nutriapp/Screens/Main/bottomTabs/progress.dart';
import 'package:nutriapp/Screens/Main/bottomTabs/suggestions.dart';

class AppState with ChangeNotifier {
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  int _drawerNavIndex = 0;
  int get drawerNavIndex => _drawerNavIndex;

  bool _isBottomNav = true;
  bool get isBottomNav => _isBottomNav;

  final List<BottomNavigationBarItem> _bottomNav = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          IconlyLight.home,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.arrow_up,
      ),
      label: 'Progress',
    ),
     BottomNavigationBarItem(
      icon:SvgPicture.asset(AssetsLoader.food,color: Colors.black,width: 25,),
      label: 'Diet Suggestions',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsLoader.chat,width: 25,color: Colors.black,),
      label: 'NutriBot',
    ),
  ];
  List<BottomNavigationBarItem> get bottomNav => _bottomNav;

  final List<Widget> _bottomNavPages = <Widget>[
    HomePage(),
    ProgressPage(),
    DietSuggestions(),
    Nutribot()
  ];

  List<Widget> get bottomNavPages => _bottomNavPages;

  final List<Widget> _bottomNavTitles = <Widget>[
    const Text('Home'),
    const Text('Progress'),
    const Text('Diet Suggestions'),
    const Text('NutriBot'),
  ];

  List<Widget> get bottomNavTitles => _bottomNavTitles;

  final List<Widget> _sideNavPages = <Widget>[

  ];

  List<Widget> get sideNavPages => _sideNavPages;

  final List<Widget> _sideNavTitles = <Widget>[
    const Text('Cashier'),
    const Text('Transactions'),
    const Text('Reports'),
    const Text('My Store'),
    const Text('Account'),
    const Text('Support'),
  ];
  List<Widget> get sideNavTitles => _sideNavTitles;

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    _isBottomNav = true;
    notifyListeners();
  }

  void setDrawerNavIndex(int index) {
    _drawerNavIndex = index;
    _isBottomNav = false;
    notifyListeners();
  }
}
