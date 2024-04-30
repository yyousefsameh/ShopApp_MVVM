import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/categories/data/category_model/datum.dart';

class ListVeiwCategoryItem extends StatelessWidget {
  const ListVeiwCategoryItem({
    super.key,
    required this.categoryDataModel,
  });
  final Datum categoryDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: categoryDataModel.image!,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            categoryDataModel.name!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}
