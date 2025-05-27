import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final bool? obscureText;
  Function(String)? onChanged;
  final String? Function(String?)? validator;

  CustomTextFormField({
    this.label,
    this.hintText,
    this.errorMessage,
    this.validator,
    this.onChanged,
    super.key,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        errorText: errorMessage,

        errorStyle: TextStyle(color: colors.error, fontSize: 16),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colors.error),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colors.primary),
        ),
        focusColor: colors.primary,
      ),
    );
  }
}
