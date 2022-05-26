import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';

class CartDataSource {
  Future<Result<List<CartInfo>>> getCartData() async {
    return Result.success(cartData);
  }

  Future<void> addCartData(CartInfo info) async {
    cartData.add(info);
  }

  Future<void> deleteCartData(int index) async {
    cartData.removeAt(index);
  }

  Future<void> updateCartData(int index, CartInfo info) async {
    cartData[index] = info;
  }
}

List<CartInfo> cartData = [];
