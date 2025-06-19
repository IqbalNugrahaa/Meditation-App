import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTextField extends HookWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final Widget Function(VoidCallback clearText)? trailingBuilder;
  final String? Function(String?)? validator;
  final double borderRadius;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color hintColor;
  final Color fillColor;

  const AppTextField._({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.trailingBuilder,
    this.validator,
    this.borderRadius = 15,
    this.textSize = 14,
    this.fontWeight = FontWeight.w400,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.fillColor = const Color(0xFFF5F6FA),
  });

  /// Factory untuk TextField biasa
  factory AppTextField({
    required String label,
    required TextEditingController controller,
    Widget Function(VoidCallback clearText)? trailingBuilder,
    String? Function(String?)? validator,
    double borderRadius = 15,
    double textSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color textColor = Colors.black,
    Color hintColor = Colors.grey,
    Color fillColor = const Color(0xFFF5F6FA),
  }) {
    return AppTextField._(
      label: label,
      isPassword: false,
      controller: controller,
      trailingBuilder: trailingBuilder,
      validator: validator,
      borderRadius: borderRadius,
      textSize: textSize,
      fontWeight: fontWeight,
      textColor: textColor,
      hintColor: hintColor,
      fillColor: fillColor,
    );
  }

  /// Factory untuk TextField password
  factory AppTextField.password({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    double borderRadius = 15,
    double textSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color textColor = Colors.black,
    Color hintColor = Colors.grey,
    Color fillColor = const Color(0xFFF5F6FA),
  }) {
    return AppTextField._(
      label: label,
      isPassword: true,
      controller: controller,
      validator: validator,
      borderRadius: borderRadius,
      textSize: textSize,
      fontWeight: fontWeight,
      textColor: textColor,
      hintColor: hintColor,
      fillColor: fillColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(isPassword);

    void clearText() => controller.clear();

    return TextFormField(
      controller: controller,
      obscureText: obscureText.value,
      validator: validator,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.text.isNotEmpty && trailingBuilder != null)
              trailingBuilder!(clearText),
            if (isPassword)
              IconButton(
                icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility,
                  color: hintColor,
                ),
                onPressed: () => obscureText.value = !obscureText.value,
              ),
          ],
        ),
      ),
    );
  }
}
