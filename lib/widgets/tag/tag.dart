import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Color? color;
  final String label;
  final String? value;
  final Function? onTap;
  final double? height;
  final double? width;
  Color _color = Color(0xff808080);
  Tag(
      {this.color,
      required this.label,
      this.onTap,
      this.value,
      this.height,
      this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: color ?? _color),
            ),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: color ?? _color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
