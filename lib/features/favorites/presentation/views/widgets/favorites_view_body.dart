import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_circular_indicator.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:shop_app/features/favorites/presentation/views/widgets/favorites_view_success_body.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
      if (state is FavoritesLoadingState) {
        return const CustomCircularIndicator();
      } else if (state is FavoritesSuccessState) {
        return FavoritesViewSuccessBody(
          favoritesProductModel: state.favoritesModel,
        );
      } else if (state is FavoritesFailureState) {
        return Center(
          child: Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 40.0),
          ),
        );
      }
      return const Center(
        child: Text(
          'Oops there was an error!',
          style: TextStyle(fontSize: 40.0),
        ),
      );
    });
  }
}
