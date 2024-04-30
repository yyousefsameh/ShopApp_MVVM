import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/features/categories/presentation/views/manager/categories_cubit/categories_cubit.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

class HomeViewBottomNavigationBarBody extends StatelessWidget {
  const HomeViewBottomNavigationBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          showUnselectedLabels: true,
          iconSize: 30.0,
          onTap: (index) {
            BlocProvider.of<HomeCubit>(context)
                .changeBottomNavigationBarIndex(index);
            switch (index) {
              case 0:
                BlocProvider.of<HomeCubit>(context).getHomeData();
                break;
              case 1:
                BlocProvider.of<CategoriesCubit>(context).getCategoriesData();
                break;
              case 2:
                BlocProvider.of<FavoritesCubit>(context).getFavoritesData();
                break;
              case 3:
                BlocProvider.of<SettingsCubit>(context).getUserProfileData();
                break;
            }
          },
          currentIndex: BlocProvider.of<HomeCubit>(context)
              .currentBottomNavigationBarItemIndex,
          selectedItemColor: ColorManager.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(
                Icons.apps,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(
                Icons.settings_outlined,
              ),
              activeIcon: Icon(Icons.settings),
            ),
          ],
        );
      },
    );
  }
}
