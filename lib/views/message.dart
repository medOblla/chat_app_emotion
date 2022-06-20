import 'package:chatt_app/models/messages_model.dart';
import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/widgets/header.dart';
import 'package:chatt_app/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class messageScreen extends StatefulWidget {
  const messageScreen({Key? key}) : super(key: key);


  @override
  _messageScreenState createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  static const Key messageKey = Key("123");
  final ScrollController _controller = ScrollController();
  TextEditingController messageController = TextEditingController();

  _addItem(message msg) {
    setState(() {
      allMsg.add(msg);
    });
  }

  void _scrollDown() {
    print("SCROOOOOOOOLING");
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Widget _chatBubbles({String message, bool isMe}) {
    //   return Container(
    //     padding: const EdgeInsets.only(left: 10, top: 18),
    //     margin: isMe
    //         ? const EdgeInsets.only(top: 8, bottom: 8, left: 100)
    //         : const EdgeInsets.only(top: 8, bottom: 8, right: 100),
    //     height: height * 0.07,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(5),
    //         // color: isMe ? Colors.black12 : Colors.white,
    //         gradient: isMe
    //             ? LinearGradient(
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //                 colors: [lightBlueColor, darkBlueColor])
    //             : LinearGradient(colors: [Colors.black12, Colors.black12])),
    //     child: Text(
    //       message,
    //       style:
    //           TextStyle(color: txtColor, fontFamily: "MADType", fontSize: 17),
    //     ),
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: bkgrdColor,
          actions: [
            IconButton(
              tooltip: "video call",
              icon: const Icon(Icons.video_call),
              onPressed: () {},
            ),
            RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                tooltip: "voice call",
                icon: const Icon(Icons.phone),
                onPressed: () {},
              ),
            ),
          ],
          elevation: 0,
        ),
        backgroundColor: bkgrdColor,
        body: Column(
          children: [
            Header(),
            SizedBox(
              height: height * 0.05,
              child: Center(
                child: Text(
                  "You can now send each other message",
                  style: TextStyle(color: blackText, fontFamily: "MADType"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
                color: bkgrdColor,
                child: ListView.builder(
                  controller: _controller,
                  itemCount: allMsg.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = allMsg[index].msg;
                    final isM = allMsg[index].isMe;
                    final time = allMsg[index].time;
                    final msgType = allMsg[index].msgType;
                    final isSeen = allMsg[index].isSeen;

                    return Column(
                      crossAxisAlignment: allMsg[index].isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        ChatBubble(
                          msg: message,
                          time: time,
                          msgType: msgType,
                          isMe: isM,
                          isSeen: isSeen, key: messageKey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              allMsg[index].time,
                              style: TextStyle(
                                  color: blackText, fontFamily: "MADType"),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              color: Colors.black12,
              height: height * 0.07,
              child: Row(
                children: [
                  // Container(
                  //   height: 38,
                  //   width: 38,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       gradient: LinearGradient(
                  //           colors: [lightBlueColor, darkBlueColor])),
                  //   child: Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(right: 10),
                  //       child: IconButton(
                  //         icon: Icon(Icons.add, color: Colors.white),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: txtColor,
                      size: 33,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt_rounded, color: blackText),
                    onPressed: () {},
                  ),
                  Expanded(
                      child: TextField(
                        style: TextStyle(color: txtColor, fontFamily: "MADType"),
                        controller: messageController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type something..",
                            hintStyle: TextStyle(
                                color: blackText, fontFamily: "MADType")),
                      )),
                  InkWell(
                    onTap: () {
                      messageController.clear();
                      message newMsg = message(
                          msg: "Hi John Wick 🖐🖐",
                          time: "Monday 11:12 AM",
                          isMe: true,
                          isSeen: true,
                          msgType: "text");
                      _addItem(newMsg);
                      Future.delayed(const Duration(milliseconds: 200), () {
                        _scrollDown();
                        setState(() {
                          // Here you can write your code for open new view
                        });
                      });
                    },
                    child: Container(
                      width: 40,
                      color: const Color(0xFFFC6C22),
                      child: Center(
                        child: Icon(
                          Icons.send,
                          color: txtColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
