import 'package:flutter/material.dart';
//import 'package:gsy_github_app_flutter/test/DemoItem.dart';
import 'package:flutterlove/PageItem.dart';
import 'package:flutterlove/MainController/MainPageWidget.dart';

class DemoPage extends StatefulWidget {

  @override
  _DemoPageState createState() => _DemoPageState();

}


class _DemoPageState extends State<DemoPage> {
  List _tabs;
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Sample'),
      ),
      body: new PageView (
        children: <Widget>[
          new Container(color: Colors.white, child: new Text(_selectedIndex.toString()),),
          new Container(color: Colors.white,child: new Text(_selectedIndex.toString())),
          new Container(color: Colors.white,child: new Text(_selectedIndex.toString())),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business'),backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School'),backgroundColor: Colors.yellow),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}




