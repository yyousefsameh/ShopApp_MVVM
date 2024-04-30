import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/color_manager.dart';

import 'package:shop_app/features/categories/data/category_model/datum.dart';

class HorizontalListViewCategoryItem extends StatelessWidget {
  const HorizontalListViewCategoryItem(
      {super.key, required this.categoryModelData});

  final Datum categoryModelData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: categoryModelData.image!,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: ColorManager.kPrimaryColor.withOpacity(0.8),
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              categoryModelData.name!,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
