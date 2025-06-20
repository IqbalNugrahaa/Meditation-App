import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTextField extends HookWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final Widget Function(VoidCallback clearText)? trailingBuilder;
  final String? Function(String?)? validator;
  final double borderRadius;
  final AutovalidateMode? autovalidateMode;
  final TextInputType textInputType;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? errorText; // ✅ Ditambahkan ke InputDecoration
  final TextStyle? errorStyle;

  const AppTextField._({
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.trailingBuilder,
    this.validator,
    this.borderRadius = 12,
    this.autovalidateMode,
    this.textInputType = TextInputType.text,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.errorText,
    this.errorStyle,
  });

  factory AppTextField({
    required String hint,
    required TextEditingController controller,
    Widget Function(VoidCallback clearText)? trailingBuilder,
    String? Function(String?)? validator,
    double borderRadius = 12,
    AutovalidateMode? autovalidateMode,
    TextInputType textInputType = TextInputType.text,
    Color? fillColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    String? errorText,
    TextStyle? errorStyle,
  }) {
    return AppTextField._(
      hint: hint,
      isPassword: false,
      controller: controller,
      trailingBuilder: trailingBuilder,
      validator: validator,
      borderRadius: borderRadius,
      autovalidateMode: autovalidateMode,
      textInputType: textInputType,
      fillColor: fillColor,
      textStyle: textStyle,
      hintStyle: hintStyle,
      errorText: errorText,
      errorStyle: errorStyle,
    );
  }

  factory AppTextField.password({
    required String hint,
    required TextEditingController controller,
    String? Function(String?)? validator,
    double borderRadius = 12,
    AutovalidateMode? autovalidateMode,
    Color? fillColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    String? errorText,
    TextStyle? errorStyle,
  }) {
    return AppTextField._(
      hint: hint,
      isPassword: true,
      controller: controller,
      validator: validator,
      borderRadius: borderRadius,
      autovalidateMode: autovalidateMode,
      fillColor: fillColor,
      textStyle: textStyle,
      hintStyle: hintStyle,
      errorText: errorText,
      errorStyle: errorStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(isPassword);
    void clearText() => controller.clear();

    return TextFormField(
      controller: controller,
      obscureText: obscureText.value,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        filled: true,
        fillColor: fillColor ?? Colors.grey.shade200,
        errorText: errorText, // ✅ errorText tampil disini otomatis
        errorStyle:
            errorStyle ?? const TextStyle(color: Colors.red, fontSize: 9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.text.isNotEmpty && trailingBuilder != null)
              trailingBuilder!(clearText),
            if (isPassword)
              IconButton(
                icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => obscureText.value = !obscureText.value,
              ),
          ],
        ),
      ),
    );
  }
}
