import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.style,
    this.counterText,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
  });

  final bool obscureText;
  final String? counterText;
  final String? labelText;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLength;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      textAlign: textAlign,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterText: counterText,
        labelText: labelText,
        contentPadding: contentPadding,
        // contentPadding: const EdgeInsets.all(0  ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
