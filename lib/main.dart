import 'package:flutter/material.dart';
import 'package:flutterlove/DemoPage.dart';
import 'package:flutterlove/MainController/Home.dart';
import 'package:flutterlove/common/global/constants.dart';
import 'package:flutterlove/page/homeDetail/HomeDetail.dart';

void main() => runApp(new DemoApp());

class DemoApp extends StatelessWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: Home(),
      routes: {
        constants.DemoPage: (context){
          return new DemoPage();
        },

        constants.HomeDetail:(context){
          return new HomeDetail();
        }
      },
    );
  }
}
