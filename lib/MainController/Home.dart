import 'package:flutter/material.dart';
import 'package:flutterlove/MainController/MainPageWidget.dart';
import 'package:flutterlove/MainController/HomeDynamicPage.dart';

class Home extends StatelessWidget {

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0,), new Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [_renderTab(Icons.school, '首页'),
      _renderTab(Icons.build, '衍生'),
      _renderTab(Icons.business, '我的')
    ];
    return new MainPgaeWidget(
      type: MainPgaeWidget.BOTTOM_TAB,
      tabItems: tabs,
      tabViews: [new HomeDynamicPage(),
      new Container(child: new Text("2"),),
      new Container(child: new Text("3"),)],
      backgroundColor: Colors.black,
      indicatorColor: Colors.orange,

    );
  }
}




