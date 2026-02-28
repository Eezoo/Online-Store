import 'package:flutter/cupertino.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_ecommerce_start/models/product.dart';
import 'package:flutter_ecommerce_start/utility/snack_bar_helper.dart';
import 'package:flutter_ecommerce_start/utility/utility_extention.dart';
import '../../../core/data/data_provider.dart';

class ProductDetailProvider extends ChangeNotifier {
  // ignore: unused_field
  final DataProvider _dataProvider;
  String? selectedVariant;
  var flutterCart = FlutterCart();

  ProductDetailProvider(this._dataProvider);

  void addToCart(Product product) {
    if (product.proVariantId!.isNotEmpty && selectedVariant == null) {
      SnackBarHelper.showErrorSnackBar(
          'Please select a variant.');
      return;
    }
    double? price = product.offerPrice != product.price ? product.offerPrice : product.price;
    flutterCart.addToCart(
      cartModel: CartModel(
        productId: '${product.sId}',
        productName: '${product.name}',
        productImages: ['${product.images.safeElementAt(0)?.url}'],
        variants: [ProductVariant (price: price ?? 0, color: selectedVariant)],
        productDetails: '${product.description}'),
    );
    selectedVariant = null;
    SnackBarHelper.showSuccessSnackBar('Product added');
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }
}


// 07:07:38 PM