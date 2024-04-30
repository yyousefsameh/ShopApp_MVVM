import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/features/favorites/data/favorites_model/datum.dart';
import 'package:shop_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

class FavoritesListViewItem extends StatelessWidget {
  const FavoritesListViewItem({
    super.key,
    required this.favoritesProductModel,
  });
  final Datum favoritesProductModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: favoritesProductModel.product!.image!,
                  width: 150,
                  height: 150,
                ),
                if (favoritesProductModel.product!.discount != 0)
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
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoritesProductModel.product!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${favoritesProductModel.product!.price!} \$',
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
                            productId: favoritesProductModel.product!.id!,
                          );
                          BlocProvider.of<FavoritesCubit>(context)
                              .getFavoritesData();
                        },
                        icon: const Icon(
                          color: Colors.red,
                          Icons.favorite,
                        ),
                      ),
                      //   icon: productModel.inFavorites!
                      //       ? const Icon(
                      //           color: Colors.red,
                      //           Icons.favorite,
                      //         )
                      //       : const Icon(
                      //           color: Colors.black54,
                      //           Icons.favorite_border_outlined,
                      //         ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
