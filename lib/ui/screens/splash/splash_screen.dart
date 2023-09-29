import 'package:e_commerce_hti/ui/screens/auth/login/login.dart';
import 'package:e_commerce_hti/ui/screens/home/home_screen.dart';
import 'package:e_commerce_hti/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Image.asset(AppAssets.splash,
          width: double.infinity,
          fit: BoxFit.fill,),
      ),
    );
  }
}
