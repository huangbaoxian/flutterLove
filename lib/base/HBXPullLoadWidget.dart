import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HBXPullLoadWidget extends StatefulWidget {
  ///item渲染
  final IndexedWidgetBuilder itemBuilder;

  ///加载更多回调
  final RefreshCallback onLoadMore;

  ///下拉刷新回调
  final RefreshCallback onRefresh;

  ///控制器，比如数据和一些配置
  final HBXPullLoadWidgetControl control;

  final Key refreshKey;

  HBXPullLoadWidget(
      this.control, this.itemBuilder, this.onRefresh, this.onLoadMore,
      {this.refreshKey});

  @override
  _HBXPullLoadWidgetState createState() => _HBXPullLoadWidgetState(this.control,
      this.itemBuilder, this.onRefresh, this.onLoadMore, this.refreshKey);
}

class _HBXPullLoadWidgetState extends State<HBXPullLoadWidget> {
  final IndexedWidgetBuilder itemBuilder;

  final RefreshCallback onLoadMore;

  final RefreshCallback onRefresh;

  final Key refreshKey;

  HBXPullLoadWidgetControl control;

  _HBXPullLoadWidgetState(this.control, this.itemBuilder, this.onRefresh,
      this.onLoadMore, this.refreshKey);

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    ///增加滑动监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ///判断当前滑动位置是不是到达底部，触发加载更多回调
        if (this.control.needLoadMore) {
          this.onLoadMore?.call();
        }
      }
    });

    // TODO: implement initState
    super.initState();
  }

  ///根据配置状态返回实际列表数量
  ///实际上这里可以根据你的需要做更多的处理
  ///比如多个头部，是否需要空页面，是否需要显示加载更多。
  _getListCount() {
    if (control.needHeader) {
      ///如果需要头部，用Item 0 的 Widget 作为ListView的头部
      ///列表数量大于0时，因为头部和底部加载更多选项，需要对列表数据总数+2
      return (control.dataList.length > 0)
          ? control.dataList.length + 2
          : control.dataList.length + 1;
    } else {
      ///如果不需要头部，在没有数据时，固定返回数量1用于空页面呈现
      if (control.dataList.length == 0) {
        return 1;
      }

      ///如果有数据,因为部加载更多选项，需要对列表数据总数+1
      return (control.dataList.length > 0)
          ? control.dataList.length + 1
          : control.dataList.length;
    }
  }

  ///根据配置状态返回实际列表渲染Item

  _getItem(int index) {
    if (!control.needHeader &&
        index == control.dataList.length &&
        control.dataList.length != 0) {
      ///如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (control.needHeader &&
        index == _getListCount() - 1 &&
        control.dataList.length != 0) {
      ///如果需要头部，并且数据不为0，当index等于实际渲染长度 - 1时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (!control.needHeader && control.dataList.length == 0) {
      ///如果不需要头部，并且数据为0，渲染空页面
      return _buildEmpty();
    } else {
      ///回调外部正常渲染Item，如果这里有需要，可以直接返回相对位置的index
      return itemBuilder(context, index);
    }
  }

  Widget _buildProgressIndicator() {
    ///是否需要显示上拉加载更多的loading
    Widget bottomWidget = control.needLoadMore
        ? new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SpinKitRotatingCircle(color: Theme.of(context).primaryColor),
              new Container(width: 5.0),
              new Text(
                '加载中',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        : new Container();
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Center(
        child: bottomWidget,
      ),
    );
  }

  Widget _buildEmpty() {
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: new Text('空页面'),
          ),
          Container(
            child: Text('空'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return _getItem(index);
        },
        physics: const AlwaysScrollableScrollPhysics(),
        ///根据状态返回子孔健
        itemCount: _getListCount(),
        ///滑动监听
        controller: _scrollController,
      ),
      ///下拉刷新触发，返回的是一个Future
      onRefresh: onRefresh,
      ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
      key: refreshKey,

    );
  }
}

class HBXPullLoadWidgetControl {
  ///数据，对齐增减，不能替换
  List dataList = new List();

  ///是否需要加载更多
  bool needLoadMore = true;

  ///是否需要头部
  bool needHeader = false;
}
