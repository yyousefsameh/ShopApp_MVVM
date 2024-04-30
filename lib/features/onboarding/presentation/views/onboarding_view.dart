import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';

import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              CacheService.saveData(key: 'onBoarding', value: true).then(
                (value) {
                  if (value) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.kLoginView,
                    );
                    // GoRouter.of(context).pushReplacement(
                    //   AppRoutes.kLoginView,
                    // );
                  }
                },
              );
            },
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: ColorManager.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
