import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
    this.maxLines,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaler: TextScaler.linear(1.0),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
