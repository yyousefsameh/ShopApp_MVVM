import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/features/favorites/data/favorites_model/favorites_model.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitialState());

  final ApiService apiService = ApiService();
  void getFavoritesData() async {
    FavoritesModel favoritesModel;
    emit(FavoritesLoadingState());
    try {
      Response response = await apiService.getData(
        endPoint: 'favorites',
        token: token,
      );

      favoritesModel = FavoritesModel.fromJson(response.data);
      emit(FavoritesSuccessState(
        favoritesModel: favoritesModel,
      ));
    } on DioException catch (e) {
      emit(FavoritesFailureState(errorMessage: e.toString()));
    }
  }
}
