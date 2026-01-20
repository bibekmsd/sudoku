import 'package:flutter/material.dart';
import 'package:practise_flutter/Pages_Buttom/settings_page.dart';
import 'package:practise_flutter/Pages_Buttom/user_profile_page.dart';
import 'package:practise_flutter/HomePage/homepage.dart';
import 'package:practise_flutter/Pages_Buttom/statistics_game.dart';

class NavigationBarBanako extends StatefulWidget {
  const NavigationBarBanako({Key? key}) : super(key: key);

  @override
  NavigationBarBanakoState createState() => NavigationBarBanakoState();
}

class NavigationBarBanakoState extends State<NavigationBarBanako> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _children = const [
    MyHomePage(),
    StatisticsPage(),
    UserProfilePage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _children,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: "Stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
