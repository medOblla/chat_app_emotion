import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/views/notification.dart';
import 'package:chatt_app/views/proba_page.dart';
import 'package:chatt_app/widgets/chatScreen.dart';
import 'package:chatt_app/widgets/searchbar.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

class BigText extends StatefulWidget {
  const BigText({Key? key}) : super(key: key);

  @override
  _BigTextState createState() => _BigTextState();
}

class _BigTextState extends State<BigText> {
  TextEditingController messageController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
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

  void _navigateToNextScreen(BuildContext context, String message) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProbaPage(message, key: widget.key)));
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:17, right: 17, top: 17, bottom: 50),
                child: Text("Enter your text : ",
                    style: TextStyle(color: txtColor, fontSize: 27)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: messageController,
                          minLines: 14,
                          maxLines: 15,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Text Here : ',
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Colors.teal,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        _navigateToNextScreen(context, messageController.text);
                      },
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
