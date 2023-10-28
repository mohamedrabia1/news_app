

import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/news/news_screen/news_screen.dart';

import '../../utilits/app_assets.dart';

class SplashScreen extends StatefulWidget {
static const routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, NewsScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}
