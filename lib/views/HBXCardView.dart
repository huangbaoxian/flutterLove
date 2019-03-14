import 'package:flutter/material.dart';

class HBXCardView extends StatefulWidget {
  @override
  _HBXCardViewState createState() => _HBXCardViewState();
}

class _HBXCardViewState extends State<HBXCardView> {

  _renderItem(IconData icon, String text) {
    return new Expanded(child: new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Icon(Icons.school, size: 16, color: Colors.grey,),
          new Padding(padding: new EdgeInsets.only(left: 5.0)),
          new Text(
            '表达式', style: new TextStyle(color: Colors.black, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,),
        ],
      ),

    ), flex: 1,);
  }


  @override
  Widget build(BuildContext context) {
    return new Card(child:  new FlatButton(onPressed: () {},
        child: new Padding(padding: new EdgeInsets.only(
            left: 0, right: 1.0, top: 10.0, bottom: 10.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [new Container(child: new Text(
              '这是一点描述', style: TextStyle(color: Colors.black, fontSize: 14.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),),
            new Padding(padding: EdgeInsets.all(10)),
            new Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderItem(Icons.star, '点在'),
                _renderItem(Icons.school, '评论'),
                _renderItem(Icons.add, '分享')
              ],),

            ],

          ),)
    ));
  }
}
