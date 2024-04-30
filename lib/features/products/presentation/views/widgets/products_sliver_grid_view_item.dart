import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/features/home/data/home_model/product.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

class ProductGridListGenerateItem extends StatelessWidget {
  const ProductGridListGenerateItem({
    super.key,
    required this.productModel,
  });
  final Product productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              CachedNetworkImage(
                imageUrl: productModel.image!,
                width: double.infinity,
                height: 180,
              ),
              if (productModel.discount != 0)
                Container(
                  color: ColorManager.kPrimaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${productModel.price!.round()}' ' \$',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ColorManager.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context)
                            .addOrDeleteToFavoirtes(
                          productId: productModel.id!,
                        );
                      },
                      icon: productModel.inFavorites!
                          ? const Icon(
                              color: Colors.red,
                              Icons.favorite,
                            )
                          : const Icon(
                              color: Colors.black54,
                              Icons.favorite_border_outlined,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
