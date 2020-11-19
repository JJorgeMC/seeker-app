import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/Tabs/Search/search_page.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/user_disappearances_page.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  final _pages = [
    SearchPage(),
    UserDisappearancesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0xFF5DD39E),
        selectedItemColor: Color(0xFF525174),
        currentIndex: _selectedPageIndex,
        elevation: 4,
        onTap: (value) {
          setState(() {
            _selectedPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
