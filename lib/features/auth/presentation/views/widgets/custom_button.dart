import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonLabel,
    required this.onTap,
    this.height = 60.0,
    this.borderRadius = 30.0,
    this.containerColor = ColorManager.kPrimaryColor,
  });
  final String buttonLabel;
  final VoidCallback onTap;
  final double? height;
  final double borderRadius;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // give button the width of the device
        width: MediaQuery.of(context).copyWith().size.width,
        height: height,
        child: Center(
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
