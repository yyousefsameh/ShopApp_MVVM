import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_manager.dart';

class CustomLoadinIndicator extends StatelessWidget {
  const CustomLoadinIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kPrimaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      // give button the width of the device
      width: MediaQuery.of(context).copyWith().size.width,
      height: 60.0,
      child: const Center(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
