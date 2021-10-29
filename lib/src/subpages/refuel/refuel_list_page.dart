import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_live/net/dio_utils.dart';
import 'package:flutter_car_live/utils/log_utils.dart';
import 'package:flutter_car_live/utils/toast_utils.dart';
import 'package:flutter_car_live/widgets/iconfont/iconfont.dart';
import 'package:flutter_car_live/widgets/new_old_price/newOldPrice.dart';
import 'package:flutter_car_live/widgets/tag/tag.dart';

class RefuelListPage extends StatefulWidget {
  _RefuelListPage createState() => _RefuelListPage();
}

class _RefuelListPage extends State<RefuelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('无感加油'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(color: Color(0xffF5F9FC)),
        decoration: BoxDecoration(color: Colors.pink[50]),
        child: Column(
          children: [
            // 搜索框
            buildInputBox(),
            // 筛选条件区域
            buildDropdownBox(),
            // 其余区域
            Expanded(
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    // 列表区域
                    buildListBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInputBox() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(IconFont.icon_search),
          border: InputBorder.none,
          hintText: '搜索附件的加油站',
        ),
      ),
    );
  }

  Widget buildDropdownBox() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildSelectItem('附近'),
          buildSelectItem('油号'),
          buildSelectItem('距离'),
        ],
      ),
    );
  }

  Widget buildSelectItem(String text) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Text(text),
            SizedBox(width: 3),
            Icon(
              IconFont.icon_arrow_down,
              size: 12,
            )
          ],
        ),
      ),
    );
  }

  Widget buildListBox() {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollNotification notification) {
        LogUtils.e("滑动结束了了了");
        //在滑动结束的时候 判断下如果滑动了 2/3数据
        //就自动加载下一页数据
        //获取滑动的距离
        //ScrollMetrics 是保存就滑动相关的信息
        // pixels
        ScrollMetrics scrollMetrics = notification.metrics;
        //获取滑动的距离
        double pixels = scrollMetrics.pixels;
        //获取最大滑动的距离
        double maxPixels = scrollMetrics.maxScrollExtent;
        //获取滑动的方向
        // AxisDirection axisDirection = scrollMetrics.axisDirection;
        if (pixels >= maxPixels / 3 * 2) {
          //加载更多
          loadmore();
        }
        //返回true 阻止再向上发送通知
        return true;
      },
      child: RefreshIndicator(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return buildListItem(
                  title: '加油站',
                  subTitle: '无锡市经济开发区清舒道88号',
                  textline3: NewOldPrice(
                    newPrice: '6.45',
                    oldPrice: '7.56',
                  ),
                  textline4: Tag(
                    label: '加油站$index',
                    color: Color(0xfff1989fa),
                  ));
            },
          ),
        ),
        onRefresh: () {
          return onRefresh();
        },
      ),
    );
  }

  Widget buildListItem({
    String title = '',
    String subTitle = '',
    Widget? textline3,
    Widget? textline4,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/maintenance.png',
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subTitle,
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  textline3 ?? Container(),
                  textline4 ?? Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 下拉刷新
  Future<bool> onRefresh() async {
    // 最少显示一秒
    await Future.delayed(Duration(milliseconds: 1000));
    ToastUtils.showToast("已刷新");
    return true;
  }

  int _pageIndex = 1;
  int _pageSize = 10;
  bool _isLoading = false;
  //加载更多
  loadmore() {
    if (!_isLoading) {
      _isLoading = true;
      _pageIndex++;
      loadingNetData();
    }
  }

  Future<void> loadingNetData() async {
    //添加一下分页请求信息
    Map<String, dynamic> map = new Map();
    //当前页数
    map["pageIndex"] = _pageIndex;
    //每页大小
    map["pageSize"] = _pageSize;
    //使用模拟数据
    ResponseInfo responseInfo =
        await Future.delayed(Duration(milliseconds: 1000), () {
      List list = [];
      for (int i = 0; i < 10; i++) {
        list.add({
          "title": "测试数据$i",
          "artInfo": "这里是测试数据的简介",
          "readCount": 100,
          "pariseCount": 120,
        });
      }
      return ResponseInfo(data: list);
    });
    //加载结束标识
    _isLoading = false;
    if (responseInfo.success) {
      List list = responseInfo.data;
      //无数据时 更新索引
      if (list.length == 0 && _pageIndex != 1) {
        _pageIndex--;
      }
      if (_pageIndex == 1) {
        //清空一下数据
      }
      list.forEach((element) {
        // 添加数据
      });
      setState(() {});
    } else {
      ToastUtils.showToast("请求失败");
    }
    return;
  }
}
