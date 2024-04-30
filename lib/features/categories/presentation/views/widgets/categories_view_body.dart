import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_circular_indicator.dart';
import 'package:shop_app/features/categories/presentation/views/manager/categories_cubit/categories_cubit.dart';
import 'package:shop_app/features/categories/presentation/views/manager/categories_cubit/categories_state.dart';
import 'package:shop_app/features/categories/presentation/views/widgets/categories_success_body.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const CustomCircularIndicator();
        } else if (state is CategoriesSuccessState) {
          return CategoriesSuccessBody(
            categoryDataModel: state.categoryModel,
          );
        } else if (state is CategoriesFailureState) {
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
      },
    );
  }
}
