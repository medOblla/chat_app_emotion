import 'dart:convert';

import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/views/notification.dart';
import 'package:chatt_app/widgets/chatScreen.dart';
import 'package:chatt_app/widgets/searchbar.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

import '../utils/api_services.dart';

class ProbaPage extends StatefulWidget {
  final String message;
  const ProbaPage(this.message, {super.key});


  @override
  _ProbaPageState createState() => _ProbaPageState();
}

class _ProbaPageState extends State<ProbaPage> {
  @override
  initState() {
    super.initState();
  }

  late dynamic emotionModel;

  dynamic _getData(msg) async {
    emotionModel = (await ApiService().getPercentage(msg));
    return emotionModel;
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
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:17, right: 17, top: 17, bottom: 30),
              child: Text("General feelings of this text",
                  style: TextStyle(color: txtColor, fontSize: 27)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: FutureBuilder(
                future: _getData(widget.message),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError){
                    final data = snapshot.data as Map;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                elevation: 20,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  width: 190,
                                  height: 150,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.emoji_emotions, size: 70, color: Colors.red,),
                                          const SizedBox(height: 20.0,),
                                          Text('${double.tryParse(data['joy'])?.toStringAsFixed(2)}% Happy', style: const TextStyle(fontSize: 18))
                                        ],
                                      )
                                  ),
                                )),
                            Card(
                                elevation: 20,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  width: 190,
                                  height: 150,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.emoji_emotions, size: 70, color: Colors.red,),
                                          const SizedBox(height: 20.0,),
                                          Text('${double.tryParse(data['sadness'])?.toStringAsFixed(2)}% Sad', style: const TextStyle(fontSize: 18))
                                        ],
                                      )
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                elevation: 20,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  width: 190,
                                  height: 150,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.emoji_emotions, size: 70, color: Colors.red,),
                                          const SizedBox(height: 20.0,),
                                          Text('${double.tryParse(data['fear'])?.toStringAsFixed(2)}% Fearful', style: const TextStyle(fontSize: 18))
                                        ],
                                      )
                                  ),
                                )),
                            Card(
                                elevation: 20,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  width: 190,
                                  height: 150,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.emoji_emotions, size: 70, color: Colors.red,),
                                          const SizedBox(height: 20.0,),
                                          Text('${double.tryParse(data['anger'])?.toStringAsFixed(2)}% Angry', style: const TextStyle(fontSize: 18))
                                        ],
                                      )
                                  ),
                                )),
                          ],
                        ),
                      ],
                    );
                  }else {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: const CircularProgressIndicator(strokeWidth: 10),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
