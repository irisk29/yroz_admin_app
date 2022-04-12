import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yroz_admin/screens/loading_splash_screen.dart';
import 'package:yroz_admin/screens/store_purchases_screen.dart';
import 'package:yroz_admin/screens/tabs_screen.dart';
import 'package:yroz_admin/screens/global_screen.dart';
import 'package:yroz_admin/screens/user_purchases_screen.dart';
import 'package:yroz_admin/screens/users_screen.dart';
import 'package:yroz_admin/screens/stores_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Admin',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFF9191, color),
          accentColor: Colors.purple,
          fontFamily: 'Montserrat',
        ),
        home: LoadingSplashScreen(),
        routes: {
          LoadingSplashScreen.routeName: (ctx) => LoadingSplashScreen(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
          GlobalScreen.routeName: (ctx) => GlobalScreen(),
          UsersScreen.routeName: (ctx) => UsersScreen(),
          StoresScreen.routeName: (ctx) => StoresScreen(),
          UserPurchasesScreen.routeName: (ctx) => UserPurchasesScreen(),
          StorePurchasesScreen.routeName: (ctx) => StorePurchasesScreen(),
        });
  }
}
