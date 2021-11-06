import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;
  final double? letterSpacing;

  KText(
      {required this.text,
      this.color,
      this.fontSize,
      this.fontFamily,
      this.maxLines,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: fontSize != null ? fontSize : 14,
        fontFamily: fontFamily != null ? fontFamily : 'Cera Regular',
        color: color != null ? color : Colors.black54,
        letterSpacing: 1.0,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
