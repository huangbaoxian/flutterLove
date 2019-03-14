import 'package:flutter/material.dart';
import 'package:flutterlove/util/NavigatorUtils.dart';
import 'package:flutterlove/model/Event.dart';
import 'package:flutterlove/common/global/constants.dart';

class EventUtils {
  static EventDesc(Event e) {
    switch (e.type) {
      case constants.KeyJump:
        {

        }
        break;

      default:
        {}
        break;
    }
  }

  //跳转
  static JumpAction(Event e, BuildContext content) {
      NavigatorUtils.pushNamed(content, e.path);
  }
}
