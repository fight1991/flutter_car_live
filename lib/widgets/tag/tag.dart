import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Color? color;
  final String label;
  Color _color = Color(0xff808080);
  Tag({this.color, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: color ?? _color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color ?? _color),
      ),
    );
  }
}
