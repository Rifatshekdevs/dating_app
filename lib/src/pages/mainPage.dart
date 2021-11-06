import 'package:dating_app/src/model/friend.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: KText(
          text: 'For you',
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Raleway Bold',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // bottom bar......
      body: Column(
        children: [
          Container(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: friend.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        friend[index].image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor('#BAB4BA'),
                            HexColor('#4F4C52'),
                          ]),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 45, top: 65),
                              child: KText(
                                text: friend[index].name,
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Raleway Bold',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 45),
                              child: KText(
                                text: friend[index].location,
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Raleway Bold',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // chat box color
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    HexColor('#FF18CF'),
                    HexColor('#FF5692').withOpacity(0.95),
                  ]),
                  borderRadius: BorderRadius.circular(25),
                ),
                // chat box
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/logo/message.png',
                        color: Colors.white,
                        width: 35,
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: KText(
                            text: 'Chat Now!',
                            color: Colors.white,
                            fontSize: 26,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 35),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    HexColor('#FF18CF'),
                    HexColor('#FF5692').withOpacity(0.95),
                  ]),
                  borderRadius: BorderRadius.circular(50),
                ),
                // voice
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
