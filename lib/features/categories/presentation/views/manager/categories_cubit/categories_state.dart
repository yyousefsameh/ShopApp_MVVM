import 'package:shop_app/features/categories/data/category_model/category_model.dart';

sealed class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}

// Categories States
class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoryModel categoryModel;

  CategoriesSuccessState({
    required this.categoryModel,
  });
}

class CategoriesFailureState extends CategoriesState {
  final String errorMessage;

  CategoriesFailureState({
    required this.errorMessage,
  });
}
