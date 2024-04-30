import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/features/categories/data/category_model/category_model.dart';
import 'package:shop_app/features/categories/presentation/views/categories_view.dart';
import 'package:shop_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:shop_app/features/home/data/favorites_status_model/favorites_status_model.dart';
import 'package:shop_app/features/home/data/home_model/home_model.dart';
import 'package:shop_app/features/home/data/home_model/product.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:shop_app/features/products/presentation/views/products_view.dart';
import 'package:shop_app/features/settings/presentation/views/settings_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final ApiService apiService = ApiService();
  FavoritesStatusModel changeFavoritesModel = FavoritesStatusModel();
  final Product productModel = const Product();

  void getHomeData() async {
    // Map<int, bool> favoiritesList = {};
    final HomeModel homeModel;
    final CategoryModel categoryModel;
    emit(ProductsLoadingState());
    try {
      Response response = await apiService.getData(
        endPoint: 'home',
        token: token,
      );
      Response categoriesResponse = await apiService.getData(
        endPoint: 'categories',
        token: token,
      );
      homeModel = HomeModel.fromJson(response.data);
      categoryModel = CategoryModel.fromJson(categoriesResponse.data);
      // for (var element in homeModel.data!.products!) {
      //   favoiritesList.addAll(
      //     {
      //       element.id!: element.inFavorites!,
      //     },
      //   );
      // }
      // print(favoiritesList);
      emit(ProductsSuccessState(
        homeModel,
        categoryModel,
      ));
    } on DioException catch (e) {
      emit(ProductsFailureState(errorMessage: e.toString()));
    }
  }

  void addOrDeleteToFavoirtes({
    required int productId,
  }) async {
    try {
      Response favoritesResponse = await apiService.addOrDeleteFromFavorites(
        productId: productId,
        endPoint: 'favorites',
        token: token!,
        data: {
          'product_id': productId,
        },
      );
      changeFavoritesModel =
          FavoritesStatusModel.fromJson(favoritesResponse.data);

      // emit(HomeChangeFavoritesSuccessState());
    } on Exception catch (e) {
      // emit(
      //   HomeChangeFavoritesFailureState(
      //     errorMessage: e.toString(),
      //   ),
      // );
    }
  }

// getCategoriesData

  int currentBottomNavigationBarItemIndex = 0;
  List<Widget> bottomNavigationBarViews = const [
    ProductsView(),
    CategoriesView(),
    FavoritesView(),
    SettingsView(),
  ];
// Change the bottom navigation bar index
  void changeBottomNavigationBarIndex(int index) {
    currentBottomNavigationBarItemIndex = index;
    emit(HomeChangeBottomNavigationBarState());
    // print(currentBottomNavigationBarItemIndex);
  }
}
