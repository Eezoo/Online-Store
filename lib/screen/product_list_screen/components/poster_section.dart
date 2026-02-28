import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce_start/utility/app_color.dart';
import 'package:flutter_ecommerce_start/widget/auto_scroll_horizontal.dart';

import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utility/constants.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        if (dataProvider.posters.isEmpty) {
          return const SizedBox();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            const double horizontalPadding = 10; // الحواف الجانبية
            final double screenWidth = constraints.maxWidth;
            final double itemWidth = screenWidth - (horizontalPadding * 2);

            return AutoScrollHorizontal(
              height: 190,
              itemCount: dataProvider.posters.length,
              itemWidth: itemWidth, // ✅ مهم جداً
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              itemBuilder: (_, index) {
                final poster = dataProvider.posters[index];

                return Container(
                  width: itemWidth, // ✅ نفس القيمة بالضبط
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightGrey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: resolveImageUrl(poster.imageUrl ?? ''),
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
