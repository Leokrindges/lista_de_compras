import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.width = 170,
    this.height = 40,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderRadius = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
