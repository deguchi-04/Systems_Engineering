import 'package:app_sys_eng/screens/main/main_page.dart';
import 'package:app_sys_eng/screens/settings/settings_page.dart';
import 'package:app_sys_eng/screens/splash/splash_page.dart';
import 'package:app_sys_eng/screens/new_station/new_station_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPageState(),
        "/main": (context) => const MainPage(),
        "/newstation": (context) => const NewStationPage(),
        "/settings": (context) => const Settings(),
      },
      theme: ThemeData(useMaterial3: true),
    );
  }
}
