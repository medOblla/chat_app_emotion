import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/views/notification.dart';
import 'package:chatt_app/widgets/chatScreen.dart';
import 'package:chatt_app/widgets/searchbar.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

import 'big_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BigText(key: widget.key)));
  }

  showOverLay(context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return const Positioned(
        top: 50,
        right: 10,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.red,
          child: Text("3"),
        ),
      );
    });
    overlayState?.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bkgrdColor,
        title: Text("Chats", style: TextStyle(color: txtColor, fontSize: 30)),
        actions: [
          IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return NotificationPage();
              }));
            },
          )
        ],
      ),
      backgroundColor: bkgrdColor,
      body: Container(
        margin: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17),
              child: SearchBar(),
            ),
            ChatScreen()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // setState(() {
            //   showOverLay(context);
            // });
            _navigateToNextScreen(context);

          },
          tooltip: "Add new contact",
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [lightBlueColor, darkBlueColor],
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}
