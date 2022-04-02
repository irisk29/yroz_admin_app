import 'package:flutter/material.dart';
import 'package:yroz_admin/tabs_screen.dart';
import 'package:yroz_admin/global_screen.dart';
import 'package:yroz_admin/users_screen.dart';
import 'package:yroz_admin/stores_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(243, 90, 106, .1),
    100: Color.fromRGBO(243, 90, 106, .2),
    200: Color.fromRGBO(243, 90, 106, .3),
    300: Color.fromRGBO(243, 90, 106, .4),
    400: Color.fromRGBO(243, 90, 106, .5),
    500: Color.fromRGBO(243, 90, 106, .6),
    600: Color.fromRGBO(243, 90, 106, .7),
    700: Color.fromRGBO(243, 90, 106, .8),
    800: Color.fromRGBO(243, 90, 106, .9),
    900: Color.fromRGBO(243, 90, 106, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Admin',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFF9191, color),
          accentColor: Colors.purple,
          fontFamily: 'Montserrat',
        ),
        home: TabsScreen(),
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
          GlobalScreen.routeName: (ctx) => GlobalScreen(),
          UsersScreen.routeName: (ctx) => UsersScreen(),
          StoresScreen.routeName: (ctx) => StoresScreen(),
        });
  }
}
