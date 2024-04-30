import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';
import 'package:shop_app/core/utils/routes_manager.dart';

String initializeStartView() {
  bool? onBoardingViewSkiped = CacheService.getData(key: 'onBoarding');
  token = CacheService.getData(key: 'token');

  String startView;

  if (onBoardingViewSkiped != null) {
    if (token != null) {
      startView = AppRoutes.kHomeView;
    } else {
      startView = AppRoutes.kLoginView;
    }
  } else {
    startView = AppRoutes.kOnBoardingView;
  }
  return startView;
}
