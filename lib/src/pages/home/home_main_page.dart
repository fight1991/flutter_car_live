import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_live/src/pages/components/TopBg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBg(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Text('恒大财富中心'),
            ],
          ),
        ),
      ],
    );
  }
}
