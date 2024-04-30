import 'package:flutter/material.dart';
import 'package:shop_app/features/search/presentaion/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SearchViewBody(),
    );
  }
}
