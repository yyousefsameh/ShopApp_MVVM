import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/core/utils/service_locator.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_app/features/auth/presentation/views/login_view.dart';
import 'package:shop_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:shop_app/features/categories/presentation/views/categories_view.dart';
import 'package:shop_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:shop_app/features/home/presentation/views/home_view.dart';
import 'package:shop_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:shop_app/features/products/presentation/views/products_view.dart';
import 'package:shop_app/features/search/presentaion/views/search_view.dart';
import 'package:shop_app/features/settings/presentation/views/settings_view.dart';

class AppRoutes {
  static const kOnBoardingView = '/';
  static const kLoginView = '/LoginView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kSearchView = '/SearchView';
  static const kProductsView = '/ProductsView';
  static const kFavoritesView = '/FavoritesView';
  static const kCategoriesView = '/CategoriesView';
  static const kSettingsView = '/SettingsView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.kOnBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case AppRoutes.kLoginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(
              getIt.get<ApiService>(),
            ),
            child: const LoginView(),
          ),
        );
      case AppRoutes.kSignUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(
              getIt.get<ApiService>(),
            ),
            child: const SignUpView(),
          ),
        );
      case AppRoutes.kHomeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case AppRoutes.kCategoriesView:
        return MaterialPageRoute(
          builder: (_) => const CategoriesView(),
        );
      case AppRoutes.kFavoritesView:
        return MaterialPageRoute(
          builder: (_) => const FavoritesView(),
        );
      case AppRoutes.kProductsView:
        return MaterialPageRoute(
          builder: (_) => const ProductsView(),
        );
      case AppRoutes.kSearchView:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
      case AppRoutes.kSettingsView:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
