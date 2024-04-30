import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/features/categories/data/category_model/category_model.dart';
import 'package:shop_app/features/categories/presentation/views/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitialState());

  final ApiService apiService = ApiService();

  void getCategoriesData() async {
    final CategoryModel categoryModel;
    emit(CategoriesLoadingState());
    try {
      Response response = await apiService.getData(
        endPoint: 'categories',
        token: token,
      );
      categoryModel = CategoryModel.fromJson(response.data);
      emit(CategoriesSuccessState(categoryModel: categoryModel));
    } on DioException catch (e) {
      emit(CategoriesFailureState(errorMessage: e.toString()));
    }
  }
}
