import 'package:dating_app/src/model/message.dart';
import 'package:dating_app/src/model/user.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleChatPage extends StatefulWidget {
  final User user;
  SingleChatPage({required this.user});
  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final Size size = Get.size;
// user chat message
  _chat(
    Message message,
    bool isMe,
    bool isSameUser,
  ) {
    if (isMe) {
      return Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: size.width * 0.80),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]),
              child: KText(
                // user message
                text: message.text,
                color: Colors.white54,
                maxLines: 3,
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    KText(
                      text: message.time,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      // condition circle read/unread message color
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                    ),
                  ],
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.done_all,
                        size: 14,
                        color:
                            message.unread ? Colors.greenAccent : Colors.black,
                      )
                    ],
                  ),
                ),
        ],
      );
    } else {
      return Column(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: size.width * 0.80),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]),
                child: KText(
                  text: message.text,
                  color: Colors.black54,
                  maxLines: 3,
                ),
              ),
            ),
            isSameUser
                ? Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        // condition circle read/unread message color
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ]),

                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(message.sender.imageUrl),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      KText(
                        text: message.time,
                        color: Colors.black45,
                      )
                    ],
                  )
                : Container(
                    child: null,
                  ),
          ],
        )
      ]);
    }
  }

// send message area
  _send() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.2),
          spreadRadius: 0,
          blurRadius: 1,
        ),
      ]),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.photo,
              color: Colors.blueGrey,
              size: 25,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'send a message',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.blueGrey,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int preUserId;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: widget.user.name,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextSpan(text: '\n'),
            // check active
            widget.user.isOnline
                ? TextSpan(
                    text: 'online',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
                : TextSpan(
                    text: 'offline',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
          ]),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];

                final bool isMe = message.sender.id == currentUser.id;
                preUserId = message.sender.id;

                final bool isSameUser = preUserId == message.sender.id;

                return _chat(message, isMe, isSameUser);
              },
            ),
          ),
          Container(child: _send())
        ],
      ),
    );
  }
}
