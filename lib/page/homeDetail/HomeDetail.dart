import 'package:flutter/material.dart';
import 'package:flutterlove/base/HBXTabBarWidget.dart';
import 'package:flutterlove/util/LogUtil.dart';
import 'package:flutterlove/page/listview/HBXListView.dart';
import 'package:flutterlove/page/listview/HBXComponentListView.dart';

class HomeDetail extends StatefulWidget {
  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  final TarWidgetControl tarBarControl = new TarWidgetControl();
  final PageController topPageControl = new PageController();

  List _tabs;
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];


  _renderTabItem() {
    var itemList = ["列表", "组件", "查看", "具体"];
    renderItem(String item, int i) {
      return new FlatButton(onPressed: () {
        LogClass.log("点击了" + item + " 是第" + i.toString() + "个");
        topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
      }, child: new Text(item, maxLines: 1,));
    }

    List<Widget> list = new List();
    for(int i = 0; i < itemList.length; i++) {
      list.add(renderItem(itemList[i], i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new HBXTabBarWidget(
      type: HBXTabBarWidget.TOP_TAB,
      tarWidgetControl: tarBarControl,
      tabItems: _renderTabItem(),
      tabViews: [new HBXListView(), new HBXComponentListView(),new Container(),new Container()],
      topPageControl: topPageControl,
      backgroundColor: Colors.black,
      indicatorColor: Colors.blue,
      title: new Title(color: Colors.yellow, child: new Text('我是标题')),
      onPageChanged: (index){
        LogClass.log("点击我了");
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
