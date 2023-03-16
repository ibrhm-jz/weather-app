import 'package:flutter/material.dart';

class HeadLine1 extends StatelessWidget {
  final String? label;
  final Color color;

  const HeadLine1({
    super.key,
    required this.label,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toString(),
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: color),
    );
  }
}

class FontSubtitle1 extends StatelessWidget {
  final String? label;
  final Color color;
  final FontWeight fontWeight;
  const FontSubtitle1({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toString(),
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.clip,
    );
  }
}

class FontSubtitle2 extends StatelessWidget {
  final String? label;
  final FontWeight fontWeight;

  const FontSubtitle2({
    super.key,
    required this.label,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toString(),
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12,
        fontWeight: fontWeight,
      ),
    );
  }
}
