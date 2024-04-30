import 'package:flutter/material.dart';

import 'package:shop_app/features/onboarding/data/models/onboarding_model/onboarding_model.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            width: 360,
            onBoardingModel.onBoardingImage,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          onBoardingModel.onBoardingTitle,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        // const Text(
        //   'Screen Body',
        //   style: TextStyle(
        //     fontSize: 14.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ],
    );
  }
}
