import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_circular_indicator.dart';

import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:shop_app/features/products/presentation/views/widgets/products_view_success_body.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const CustomCircularIndicator();
        } else if (state is ProductsSuccessState) {
          return ProductsSuccessBody(
            homeModel: state.homeModel,
            categoryModel: state.categoryModel,
          );
        } else if (state is ProductsFailureState) {
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
