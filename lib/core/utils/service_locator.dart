// import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shop_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupApiServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
        // Dio(),
        ),
  );
}

// Future<SharedPreferences> setupSharedPreferenceLocator() async {
//   SharedPreferences sharedPreferences;
//   getIt.registerSingleton<CacheService>(
//     CacheService(
//       sharedPreferences = await SharedPreferences.getInstance(),
//     ),
//   );
//   return sharedPreferences;
// }
