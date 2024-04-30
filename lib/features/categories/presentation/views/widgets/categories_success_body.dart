import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_divider.dart';
import 'package:shop_app/features/categories/data/category_model/category_model.dart';

import 'package:shop_app/features/categories/presentation/views/widgets/list_view_category_item.dart';

class CategoriesSuccessBody extends StatelessWidget {
  const CategoriesSuccessBody({
    super.key,
    required this.categoryDataModel,
  });
  final CategoryModel categoryDataModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ListVeiwCategoryItem(
        categoryDataModel: categoryDataModel.data!.data![index],
      ),
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: categoryDataModel.data!.data!.length,
    );
  }
}
