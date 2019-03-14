import 'package:flutter/material.dart';
import 'package:flutterlove/util/LogUtil.dart';

class HBXComponentListView extends StatefulWidget {
  @override
  _HBXComponentListViewState createState() => _HBXComponentListViewState();
}

class _HBXComponentListViewState extends State<HBXComponentListView> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _renderItemView(),
    );
  }

  _renderItemView() {
    List<Widget> list = new List();

    list.add(new Card(
        child: new Column(
      children: [
        new Padding(padding: new EdgeInsets.only(top: 20)),
        new Text(
          "我是文本",
          style: new TextStyle(color: Colors.black, fontSize: 14.0),
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 20)),
      ],
    )));

    list.add(new Card(
      child: new Column(
        children: [
          new Text("我是一张图片"),
          new Image(
              height: 200,
              width: 200,
              image: new NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552480987852&di=0eb2962c59696e00cc0ff74657e0bc73&imgtype=0&src=http%3A%2F%2Fimg1.xcarimg.com%2Fexp%2F2872%2F2875%2F2937%2F20101220130509576539.jpg"))
        ],
      ),
    ));

    list.add(new Card(
      child: new Column(
        children: [
          new Text(
            '我是一个icon',
            style: new TextStyle(color: Colors.black, fontSize: 14),
          ),
          new Icon(
            Icons.school,
          ),
        ],
      ),
    ));

    list.add(new Card(
      child: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text('我是一个弹出选项标题'),
          new PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                new PopupMenuItem(child: new Text('选项一')),
                new PopupMenuItem(child: new Text('选项二'))
              ];
            },
            child: new Text('我是一个选择弹框'),
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20)),
        ],
      ),
    ));

    list.add(new Card(
      child: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text('我是一排按钮'),
          new ButtonBar(
            children: <Widget>[
              new Text('按钮1'),
              new Text('按钮2'),
              new Text('按钮3'),
              new Text('按钮4'),
            ],
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20)),
        ],
      ),
    ));

    list.add(new Column(
      children: <Widget>[
        new Text('我是一排均分的视图'),
        new Row(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(top: 20)),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  LogClass.log('点击蓝色按钮');
                },
                color: Colors.blue,
                child: new Text('蓝色按钮'),
              ),
              flex: 1,
            ),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  LogClass.log('点击红色按钮');
                },
                color: Colors.red,
                child: new Text('红色按钮'),
              ),
              flex: 1,
            ),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  LogClass.log('点击灰色按钮');
                },
                color: Colors.grey,
                child: new Text('灰色按钮'),
              ),
              flex: 1,
            ),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  LogClass.log('点击紫色按钮');
                },
                color: Colors.purple,
                child: new Text('紫色按钮'),
              ),
              flex: 1,
            ),
            
            new Padding(padding: new EdgeInsets.only(top: 20)),
          ],
        )
      ],
    ));

    list.add(new Card(
      child: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(bottom: 20)),
          new Text('输入框展示'),
          new TextField(
            onChanged: (text) {
              LogClass.log(text);
            },
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20)),
        ],
      ),
    ));

    list.add(new Card(
        child: new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.only(bottom: 20)),
        new Text('我是一个滑块'),
        new Switch(value: true, onChanged: (on) {

          LogClass.log('滑块打开'  + on.toString());

        }),
        new Padding(padding: new EdgeInsets.only(bottom: 20))
      ],
    )));

    return list;
  }
}
