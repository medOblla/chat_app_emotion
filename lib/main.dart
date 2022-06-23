import 'package:chatt_app/home.dart';
import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/views/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: BigText(),
    debugShowCheckedModeBanner: false,
    //Set themedata darkMode and LightMode
    theme: ThemeData(
      canvasColor: bkgrdColor,
    ),
  ));
}
