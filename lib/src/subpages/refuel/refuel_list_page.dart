import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
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
}
