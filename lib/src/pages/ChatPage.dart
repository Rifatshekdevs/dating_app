import 'package:dating_app/src/model/message.dart';
import 'package:dating_app/src/pages/singleChatPage.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: KText(
          color: Colors.black,
          text: 'Chat',
          fontSize: 22,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Get.to(() => SingleChatPage()),
            child: Container(
              // circle image
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(2),
                  // condition circle read/unread message color
                  decoration: chat.unread
                      ? BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ])
                      : BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chat.sender.imageUrl),
                  ),
                ),
                Container(
                  width: size.width * 0.65,
                  child: Padding(
                    // row text pading
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Name..
                            Row(
                              children: [
                                KText(
                                  text: chat.sender.name,
                                  color: Colors.black,
                                  fontFamily: 'Raleway Bold',
                                  fontSize: 16,
                                ),
                                // check user online/offline
                                chat.sender.isOnline
                                    ? Container(
                                        margin: EdgeInsets.only(left: 5),
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.greenAccent,
                                        ),
                                      )
                                    : Container(
                                        child: null,
                                      ),
                              ],
                            ),
                            // time
                            KText(
                              text: chat.time,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // chat out text
                          child: KText(
                            color: Colors.black54,
                            fontSize: 12,
                            text: chat.text,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
