import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/splash/splash_screen.dart';
import 'package:news_app/ui/utilits/app_theme.dart';
import 'ui/screens/home/home_screen.dart';




void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        HomeScreen.routeName: (_) =>  HomeScreen(),
        SplashScreen.routeName: (_) => SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}


