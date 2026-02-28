import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../screen/product_favorite_screen/provider/favorite_provider.dart';
import '../utility/extensions.dart';
import '../utility/utility_extention.dart';
import 'custom_network_image.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  final int index;
  final bool isPriceOff;

  const ProductGridTile({
    super.key,
    required this.product,
    required this.index,
    required this.isPriceOff,
  });

  @override
  Widget build(BuildContext context) {
    double discountPercentage = context.dataProvider
        .calculateDiscountPercentage(
            product.price ?? 0, product.offerPrice ?? 0);
    return GridTile(
      header: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: discountPercentage != 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFE6E6E6),
                    ],
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                width: 80,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "OFF ${discountPercentage.toInt()} %",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Selector<FavoriteProvider, bool>(
              selector: (_, provider) =>
                  provider.checkIsItemFavorite(product.sId ?? ''),
              builder: (context, isFavorite, child) {
                return IconButton(
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    context
                        .read<FavoriteProvider>()
                        .updateToFavoriteList(product.sId ?? '');
                  },
                );
              },
            ),
          ],
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: const Color.fromARGB(154, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  product.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    // color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      textDirection: TextDirection.rtl,
                      product.offerPrice != 0
                          ? " ${product.offerPrice} د.ل" //Todo: localization
                          : " ${product.price} د.ل",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13, // غيّر الرقم كما تريد
                            fontWeight: FontWeight.w600,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 3),
                  if (product.offerPrice != null &&
                      product.offerPrice != product.price)
                    Flexible(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        " ${product.price} د.ل", //Todo: localization
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
      child: Container(
        // margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          // color: const Color(0xFFE5E6E8),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE6E6E6),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFE6E6E6),
            ],
          ),
        ),
        child: CustomNetworkImage(
          imageUrl: product.images!.isNotEmpty
              ? product.images?.safeElementAt(0)?.url ?? ''
              : '',
          fit: BoxFit.scaleDown,
          scale: 3.0,
        ),
      ),
    );
  }
}
