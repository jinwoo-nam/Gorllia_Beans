import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';

abstract class CartRepository {
  Future<Result<List<CartInfo>>> getCartData();
  Future<void> addCartData(CartInfo info);
  Future<void> deleteCartData(int index);
  Future<void> updateCartData(int index, CartInfo info);
}