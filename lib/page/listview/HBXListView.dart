import 'package:flutter/material.dart';
import 'package:flutterlove/views/HBXCardView.dart';


class HBXListView extends StatefulWidget {
  @override
  _HBXListViewState createState() => _HBXListViewState();
}

class _HBXListViewState extends State<HBXListView> {
  @override
  Widget build(BuildContext context) {
    return new ListView(children: [new HBXCardView(), new HBXCardView(), new HBXCardView()],);
  }
}
