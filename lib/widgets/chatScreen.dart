import 'package:chatt_app/models/chat_models.dart';
import 'package:chatt_app/views/message.dart';
import 'package:chatt_app/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const Key listKey = Key("123");
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recent.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              print(index.toString());
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return messageScreen();
              }));
            },
            child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomListTile(
                  imgUrl: recent[index].imgUrl,
                  message: recent[index].message,
                  active: recent[index].active,
                  lastActive: recent[index].lastActive,
                  sender: recent[index].sender, key: listKey,
                )),
          );
        },
      ),
    );
  }
}
