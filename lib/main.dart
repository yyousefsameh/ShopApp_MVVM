import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/functions/initialize_start_view.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/core/utils/service_locator.dart';
import 'package:shop_app/features/categories/presentation/views/manager/categories_cubit/categories_cubit.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupSharedPreferenceLocator();
  setupApiServiceLocator();
  await CacheService.initSharedPreferences();
  String startView = initializeStartView();

  runApp(
    ShopApp(startView: startView),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({
    super.key,
    required this.startView,
  });

  // This widget is the root of your application.

  final String startView;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..getHomeData(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: startView,
      ),
    );
  }
}
