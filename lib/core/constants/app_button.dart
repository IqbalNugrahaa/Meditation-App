import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isOutlined;
  final Color borderColor;

  const AppButton._({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    required this.isOutlined,
  });

  /// Contained button (solid)
  factory AppButton.contained({
    required String text,
    required VoidCallback onPressed,
    double? width,
    double height = 50,
    Color? backgroundColor,
    Color? textColor,
    double borderRadius = 12,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = 16,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      backgroundColor: backgroundColor ?? Colors.deepPurple,
      textColor: textColor ?? Colors.white,
      borderColor: Colors.transparent,
      borderRadius: borderRadius,
      fontWeight: fontWeight,
      fontSize: fontSize,
      isOutlined: false,
    );
  }

  /// Outline button
  factory AppButton.outline({
    required String text,
    required VoidCallback onPressed,
    double? width,
    double height = 50,
    Color? borderColor,
    Color? textColor,
    double borderRadius = 12,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = 16,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      backgroundColor: Colors.transparent,
      textColor: textColor ?? borderColor ?? Colors.deepPurple,
      borderColor: borderColor ?? Colors.deepPurple,
      borderRadius: borderRadius,
      fontWeight: fontWeight,
      fontSize: fontSize,
      isOutlined: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: borderColor),
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
            ),
    );
  }
}
