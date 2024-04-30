import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_divider.dart';
import 'package:shop_app/features/favorites/data/favorites_model/favorites_model.dart';
import 'package:shop_app/features/favorites/presentation/views/widgets/favorites_list_view_item.dart';

class FavoritesViewSuccessBody extends StatelessWidget {
  const FavoritesViewSuccessBody({
    super.key,
    required this.favoritesProductModel,
  });

  final FavoritesModel favoritesProductModel;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: favoritesProductModel.data!.data!.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => FavoritesListViewItem(
          favoritesProductModel: favoritesProductModel.data!.data![index],
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: favoritesProductModel.data!.data!.length,
      ),
      fallback: (context) => const Center(
        child: Text(
          'No favoirtes yet!, Go and add some.',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
