import 'package:dating_app/src/pages/quizePage.dart';
import 'package:dating_app/src/pages/signupPage.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: HexColor('#FF06EB').withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    //back button
                    child: Center(
                        child: Center(
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: HexColor('#FF06EB').withOpacity(.8),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  KText(
                    color: Colors.black,
                    text: 'Sign In',
                    fontSize: 25,
                    fontFamily: 'Raleway Bold',
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 55),
                    child:
                        KText(text: 'Sign In with one of the following option'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 70,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          FontAwesomeIcons.facebookF,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 70,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          FontAwesomeIcons.google,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  // name feild
                  Padding(
                    padding: EdgeInsets.only(right: 310),
                    child: KText(
                      text: 'Name',
                      fontSize: 20,
                      fontFamily: 'Raleway Black',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide:
                                BorderSide(color: Colors.red, width: .5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                                color: HexColor('#FF38A9'), width: .5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: HexColor('#FF38A9'),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                            color: HexColor('#535A6A'),
                            height: 1.4,
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.white38,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  // password feild
                  Padding(
                    padding: EdgeInsets.only(right: 260),
                    child: KText(
                      text: 'password',
                      fontSize: 20,
                      fontFamily: 'Raleway Black',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide:
                                BorderSide(color: Colors.red, width: .5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                                color: HexColor('#FF38A9'), width: .5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: HexColor('#FF38A9'),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                            color: HexColor('#535A6A'),
                            height: 1.4,
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.white38,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.050,
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    HexColor('#FF18CF'),
                    HexColor('#FF5692').withOpacity(0.95),
                  ], begin: Alignment.topLeft, end: Alignment.centerRight),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => QuizePage());
                    },
                    child: KText(
                      text: 'Log In',
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'raleway Bold',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.070,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    KText(
                      text: "Dont'n already have an account?",
                      color: HexColor('#694467'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupPage());
                      },
                      child: KText(
                        text: 'Sign IN',
                        color: HexColor('#50254E'),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
