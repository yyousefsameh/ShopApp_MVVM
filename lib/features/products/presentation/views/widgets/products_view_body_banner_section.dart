import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/data/home_model/home_model.dart';

class ProductsBannersSection extends StatelessWidget {
  const ProductsBannersSection({
    super.key,
    required this.homeModel,
  });
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeModel.data!.banners!
          .map(
            (banner) => CachedNetworkImage(
              imageUrl: banner.image!,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.black54,
                  size: 30.0,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 250,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 15),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.easeInOut,
      ),
    );
  }
}
