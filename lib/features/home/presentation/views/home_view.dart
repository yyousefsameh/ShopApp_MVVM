import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:shop_app/features/home/presentation/views/widgets/home_view_bottom_navigation_bar_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'SALLA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.kSearchView);
            },
            icon: const Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: const HomeViewBody(),
      bottomNavigationBar: const HomeViewBottomNavigationBarBody(),
    );
  }
}
