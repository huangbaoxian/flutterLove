import 'package:flutter/material.dart';
import 'package:flutterlove/base/HBXListState.dart';
import 'package:flutterlove/base/HBXPullLoadWidget.dart';
import 'package:flutterlove/util/LogUtil.dart';
import 'package:flutterlove/model/Event.dart';
import 'package:flutterlove/common/global/constants.dart';
import 'package:flutterlove/util/EventUtils.dart';


class HomeDynamicPage extends StatefulWidget {
  @override
  _HomeDynamicPageState createState() => _HomeDynamicPageState();
}

class _HomeDynamicPageState extends State<HomeDynamicPage>
    with
        AutomaticKeepAliveClientMixin<HomeDynamicPage>,
        HBXListState<HomeDynamicPage>,
        WidgetsBindingObserver {
  @override
  Future<Null> handleRefresh() async {
    // TODO: implement handleRefresh
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 1;
    LogClass.log("刷新");
    List newList = [];
    for (int i = 0; i < 10; i++) {
      newList.add('333');
    }
    pullLoadWidgetControl.dataList.addAll(newList);
    setState(() {
      pullLoadWidgetControl.needLoadMore = true;
    });
//    resolveDataResult(newList);
    isLoading = false;
    return null;
  }

  @override
  Future<Null> onLoadMore() async {
    if (isLoading) {
      return null;
    }
    LogClass.log("加载更多");
    isLoading = true;
    page++;
    LogClass.log("加载更多");

    List newList = [];
    for (int i = 0; i < 10; i++) {
      newList.add('333');
    }
    pullLoadWidgetControl.dataList.addAll(newList);
//    var result = await EventDao.getEventReceived(_getStore(), page: page);
    setState(() {
      pullLoadWidgetControl.needLoadMore = true;
    });
    isLoading = false;
    return null;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  requestRefresh() {}

  @override
  requestLoadMore() {}

  @override
  bool get isRefreshFirst => false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    for (int i = 0; i < 10; i++) {
      pullLoadWidgetControl.dataList.add('333');
    }

    if (pullLoadWidgetControl.dataList.length == 0) {
      showRefreshLoading();
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (pullLoadWidgetControl.dataList.length != 0) {
        showRefreshLoading();
      }
    }
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  _renderEventItem(item) {
    return new Card(
      child: new FlatButton(
          onPressed: () {
            LogClass.log('点击我了');
            Event event = new Event(constants.KeyJump, constants.HomeDetail);
            EventUtils.JumpAction(event, context);
          },
          child: new Text(
              '测试一波 测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波测试一波')),
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HBXPullLoadWidget(
      pullLoadWidgetControl,
      (BuildContext context, int index) =>
          _renderEventItem(pullLoadWidgetControl.dataList[index]),
      handleRefresh,
      onLoadMore,
      refreshKey: refreshIndicatorKey,
    );
  }
}
