import 'package:dating_app/src/pages/loginPage.dart';
import 'package:dating_app/src/pages/signupPage.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class WellcomePage extends StatefulWidget {
  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.10),
            child: Center(
              child: Image.asset('assets/logo/Logo.png'),
            ),
          ),
          Center(
            child: KText(
              color: Colors.black,
              text: "It's our first time\nseeing you hear at\n BlindLove!",
              fontSize: 24,
              fontFamily: 'Raleway Bold',
            ),
          ),
          SizedBox(
            height: size.height * 0.10,
          ),
          // sign up
          GestureDetector(
            onTap: () {
              Get.to(() => SignupPage());
            },
            child: Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
                  HexColor('#FF18CF'),
                  HexColor('#FF5692').withOpacity(0.95),
                ], begin: Alignment.topLeft, end: Alignment.centerRight),
              ),
              child: Center(
                child: KText(
                  text: 'Sign Up',
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'raleway Bold',
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          //sign In
          GestureDetector(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
                  HexColor('#FF18CF'),
                  HexColor('#FF5692').withOpacity(0.95),
                ], begin: Alignment.topLeft, end: Alignment.centerRight),
              ),
              child: Center(
                child: KText(
                  text: 'Sign In',
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'raleway Bold',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
