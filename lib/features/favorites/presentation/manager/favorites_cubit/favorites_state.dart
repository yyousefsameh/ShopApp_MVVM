import 'package:shop_app/features/favorites/data/favorites_model/favorites_model.dart';

abstract class FavoritesState {}

final class FavoritesInitialState extends FavoritesState {}

final class FavoritesLoadingState extends FavoritesState {}

final class FavoritesSuccessState extends FavoritesState {
  final FavoritesModel favoritesModel;

  FavoritesSuccessState({required this.favoritesModel});
}

final class FavoritesFailureState extends FavoritesState {
  final String errorMessage;

  FavoritesFailureState({required this.errorMessage});
}
