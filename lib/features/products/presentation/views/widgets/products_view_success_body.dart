import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/features/categories/data/category_model/category_model.dart';

import 'package:shop_app/features/home/data/home_model/home_model.dart';
import 'package:shop_app/features/products/presentation/views/widgets/categories_horizontal_list_view.dart';
import 'package:shop_app/features/products/presentation/views/widgets/products_sliver_grid_view.dart';
import 'package:shop_app/features/products/presentation/views/widgets/products_view_body_banner_section.dart';

class ProductsSuccessBody extends StatelessWidget {
  const ProductsSuccessBody({
    super.key,
    required this.homeModel,
    required this.categoryModel,
  });

  final HomeModel homeModel;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductsBannersSection(
                homeModel: homeModel,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CategoriesListView(
                      categoryModel: categoryModel,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'New Products',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        ProductsSliverGridView(
          homeModel: homeModel,
        ),
      ],
    );
  }
}
