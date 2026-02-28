import 'package:flutter_ecommerce_start/utility/extensions.dart';

import 'provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      context.favoriteProvider.loadFavoriteItems();
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "المفضلة", //Favorites
      //     style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //         color: AppColor.darkBlue),
      //   ),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, child) {
              return ProductGridView(
                items: favoriteProvider.favoriteProduct,
              );
            },
          )),
    );
  }
}
