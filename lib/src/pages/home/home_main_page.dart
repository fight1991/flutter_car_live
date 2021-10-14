import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 5),
            Text('恒大财富中心'),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [buildGridBox()],
        ),
      ),
    );
  }

  Widget buildGridBox() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          girdBtnItem(iconName: 'oil.png', label: '无感加油'),
          girdBtnItem(iconName: 'maintenance.png', label: '维修保养'),
          girdBtnItem(iconName: 'wash.png', label: '洗车美容'),
          girdBtnItem(iconName: 'parking.png', label: '智慧停车'),
        ],
      ),
    );
  }

  Widget girdBtnItem({String iconName = 'oil.png', String label = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$iconName',
          width: 64,
          height: 64,
        ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
