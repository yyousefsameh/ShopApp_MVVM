import 'package:flutter/material.dart';
import 'package:shop_app/features/categories/data/category_model/category_model.dart';
import 'package:shop_app/features/products/presentation/views/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HorizontalListViewCategoryItem(
          categoryModelData: categoryModel.data!.data![index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: categoryModel.data!.data!.length,
      ),
    );
  }
}
