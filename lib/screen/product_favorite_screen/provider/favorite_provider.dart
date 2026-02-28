import '../../../utility/constants.dart';
import '../../../core/data/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final DataProvider _dataProvider;
  final box = GetStorage();
  List<Product> favoriteProduct = [];

  FavoriteProvider(this._dataProvider) {
    loadFavoriteItems();
  }

  void updateToFavoriteList(String productId) {
    if (productId.isEmpty) return;
    List<dynamic> rawList = box.read(FAVORITE_PRODUCT_BOX) ?? [];
    List<String> favoriteList = rawList.map((e) => e.toString()).toList();
    if (favoriteList.contains(productId)) {
      favoriteList.remove(productId);
    } else {
      favoriteList.add(productId);
    }

    box.write(FAVORITE_PRODUCT_BOX, favoriteList);
    loadFavoriteItems();
    notifyListeners();
  }

  bool checkIsItemFavorite(String productId) {
    if (productId.isEmpty) return false;
    List<dynamic> rawList = box.read(FAVORITE_PRODUCT_BOX) ?? [];
    List<String> favoriteList = rawList.map((e) => e.toString()).toList();
    return favoriteList.contains(productId);
  }

  void loadFavoriteItems() {
    List<dynamic> rawList = box.read(FAVORITE_PRODUCT_BOX) ?? [];
    List<String> favoriteListIds = rawList.map((e) => e.toString()).toList();
    favoriteProduct = _dataProvider.products.where((product) {
      return favoriteListIds.contains(product.sId ?? '');
    }).toList();
    notifyListeners();
  }

  void clearFavoriteList() {
    box.remove(FAVORITE_PRODUCT_BOX);
    favoriteProduct = [];
    notifyListeners();
  }
}
