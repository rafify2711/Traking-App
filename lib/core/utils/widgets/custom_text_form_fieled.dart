import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/colors.dart';

class CustomTextFormFieled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final bool isObsecureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;

  const CustomTextFormFieled({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.isObsecureText,
    this.validator,
    this.suffix,
    this.readOnly,
    this.onChanged,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: textEditingController,
      obscureText: isObsecureText,
      obscuringCharacter: "*",
      style: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
        color: PalletsColors.white70,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall?.copyWith(
          color: PalletsColors.white90,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(18),
        suffixIcon: suffix,

        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),

        hintText: hintText,
        hintStyle: ApplicationTheme.themeData.textTheme.bodyLarge?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
