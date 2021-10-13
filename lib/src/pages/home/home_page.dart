import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_live/utils/log_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              LogUtils.e('点击');
              Fluttertoast.showToast(
                  msg: '你好',
                  backgroundColor: Colors.red,
                  toastLength: Toast.LENGTH_LONG);
            },
            child: Text('弹框'),
          ),
        ),
      ),
    );
  }
}
