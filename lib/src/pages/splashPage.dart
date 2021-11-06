import 'package:dating_app/src/pages/wellcomePage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatetowelcomePage();
  }

  _navigatetowelcomePage() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WellcomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'assets/splash/Splash Screen.png',
          width: 550,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
