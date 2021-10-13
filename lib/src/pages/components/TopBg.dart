import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBg extends StatelessWidget {
  final Widget? child;
  TopBg({Key? key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 10,
        right: 10,
      ),
      height: 156,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: child,
    );
  }
}
