import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return HomeCubit.get(context).bottomNavigationBarViews[
            HomeCubit.get(context).currentBottomNavigationBarItemIndex];
      },
    );
  }
}
