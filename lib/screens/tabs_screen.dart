import 'package:flutter/material.dart';
import 'package:yroz_admin/screens/global_screen.dart';
import 'package:yroz_admin/screens/login_screen.dart';
import 'package:yroz_admin/screens/stores_screen.dart';
import 'package:yroz_admin/screens/users_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [GlobalScreen(), UsersScreen(), StoresScreen()];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin"),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushReplacementNamed(EmailSignInPage.routeName);
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
//      resizeToAvoidBottomInset: false,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home_outlined),
              label: 'Global',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.people_alt_outlined),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.store_outlined),
              label: 'Stores',
            ),
          ]),
    );
  }
}
