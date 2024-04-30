import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:shop_app/core/utils/assets_manager.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/onboarding/data/models/onboarding_model/onboarding_model.dart';

import 'package:shop_app/features/onboarding/presentation/views/widgets/onboarding_page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLastOnBoardingPage = false;
    final PageController onBoardingPageViewController = PageController();
    final List<OnBoardingModel> onBoardingList = [
      OnBoardingModel(
        onBoardingImage: AppImageAssets.kOnBoardingImage1,
        onBoardingTitle: 'Welcome to our shop',
      ),
      OnBoardingModel(
        onBoardingImage: AppImageAssets.kOnBoardingImage2,
        onBoardingTitle: 'Discover exclusive deals and discounts',
      ),
      OnBoardingModel(
        onBoardingImage: AppImageAssets.kOnBoardingImage3,
        onBoardingTitle:
            'Your cart is feeling a bit lonely. Start shopping now!',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == onBoardingList.length - 1) {
                  isLastOnBoardingPage = true;
                } else {
                  isLastOnBoardingPage = false;
                }
              },
              controller: onBoardingPageViewController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => OnBoardingPageViewItem(
                onBoardingModel: onBoardingList[index],
              ),
              itemCount: onBoardingList.length,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5.0,
                  activeDotColor: ColorManager.kPrimaryColor,
                ),
                controller: onBoardingPageViewController,
                count: onBoardingList.length,
              ),
              const Spacer(),
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: ColorManager.kPrimaryColor,
                child: const Icon(
                  color: Colors.white,
                  Icons.arrow_forward,
                ),
                onPressed: () {
                  if (isLastOnBoardingPage) {
                    CacheService.saveData(key: 'onBoarding', value: true).then(
                      (value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.kLoginView,
                          );
                        }
                      },
                    );
                    // GoRouter.of(context).pushReplacement(
                    //   AppRoutes.kLoginView,
                    // );
                  } else {
                    onBoardingPageViewController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
