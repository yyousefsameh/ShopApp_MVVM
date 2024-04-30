import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.keyBoardType,
    this.prefixIcon,
  });

  final String? hintText;
  final Function(String)? onChanged;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.kPrimaryColor,
      keyboardType: keyBoardType,
      controller: controller,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
