import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_manager.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.kPrimaryColor,
      ),
    );
  }
}
