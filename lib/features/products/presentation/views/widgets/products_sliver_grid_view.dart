import 'package:flutter/material.dart';
import 'package:shop_app/features/home/data/home_model/home_model.dart';
import 'package:shop_app/features/products/presentation/views/widgets/products_sliver_grid_view_item.dart';

class ProductsSliverGridView extends StatelessWidget {
  const ProductsSliverGridView({
    super.key,
    required this.homeModel,
  });
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: BoxDecoration(color: Colors.grey[300]),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1 / 1.43,
        ),
        itemCount: homeModel.data!.products!.length,
        itemBuilder: (context, index) => ProductGridListGenerateItem(
          productModel: homeModel.data!.products![index],
        ),
      ),
    );
  }
}
