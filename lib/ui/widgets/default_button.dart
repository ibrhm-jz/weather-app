import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback function;
  final bool preffix;
  final Color color;
  final Color fontColor;
  final double widthSize;

  const DefaultButton({
    super.key,
    required this.text,
    required this.icon,
    required this.function,
    this.preffix = false,
    this.color = Colors.black87,
    this.fontColor = Colors.white,
    this.widthSize = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: Size(widthSize, 45),
        elevation: 0,
      ),
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: !preffix,
            child: Icon(
              icon,
              size: 20,
              color: fontColor,
            ),
          ),
          Visibility(
            visible: !preffix,
            child: const SizedBox(width: 10),
          ),
          Text(
            text.toString(),
            style: TextStyle(color: fontColor),
          ),
          Visibility(
            visible: preffix,
            child: const SizedBox(width: 10),
          ),
          Visibility(
            visible: preffix,
            child: Icon(
              icon,
              size: 20,
              color: fontColor,
            ),
          )
        ],
      ),
    );
  }
}
