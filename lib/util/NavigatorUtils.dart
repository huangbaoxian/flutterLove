import 'dart:async';
import 'package:flutter/material.dart';


class NavigatorUtils {

  //切换无参数的页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }



}