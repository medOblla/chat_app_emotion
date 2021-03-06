import 'package:chatt_app/models/notification_model.dart';
import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int defaultSelected = 0;
  static const Key notificationKey = Key("123");
  List<String> notificationType = ["All", "Friend Request", "Payment"];

  _buildNotificationFilter() {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        width: double.infinity,
        height: 50,
        child: Wrap(
            spacing: 5.0,
            children:
                List<Widget>.generate(notificationType.length, (int index) {
              return ChoiceChip(
                backgroundColor: txtColor,
                label: Text(
                  notificationType[index].toString(),
                  style: const TextStyle(fontFamily: "MADType", fontSize: 17),
                ),
                onSelected: (bool selected) {
                  setState(() {
                    defaultSelected = selected ? index : 0;
                    print(notificationType[index]);
                  });
                },
                selected: defaultSelected == index,
              );
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bkgrdColor,
        title: Text(
          "Notifications",
          style: TextStyle(color: txtColor, fontSize: 25),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNotificationFilter(),
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Text(
              "Older",
              style: TextStyle(
                  color: blackText, fontFamily: "MADType", fontSize: 20),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: allNotification.length,
              itemBuilder: (BuildContext context, int index) {
                var username = allNotification[index].userName;
                var time = allNotification[index].time;
                var imgUrl = allNotification[index].userImg;
                var type = allNotification[index].notType;
                return NotifWidget(
                  userName: username,
                  time: time,
                  userImg: imgUrl,
                  notType: type, key: notificationKey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
