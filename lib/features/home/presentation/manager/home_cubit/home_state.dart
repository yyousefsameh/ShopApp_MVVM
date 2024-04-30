import 'package:shop_app/features/categories/data/category_model/category_model.dart';
import 'package:shop_app/features/home/data/home_model/home_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

// Products States
class ProductsLoadingState extends HomeState {}

class ProductsSuccessState extends HomeState {
  final HomeModel homeModel;
  final CategoryModel categoryModel;

  ProductsSuccessState(this.homeModel, this.categoryModel);
}

class ProductsFailureState extends HomeState {
  final String errorMessage;

  ProductsFailureState({
    required this.errorMessage,
  });
}

class HomeChangeBottomNavigationBarState extends HomeState {}

// class HomeChangeFavoritesSuccessState extends HomeState {}

// class HomeChangeFavoritesFailureState extends HomeState {
//   final String errorMessage;

//   HomeChangeFavoritesFailureState({required this.errorMessage});
// }
