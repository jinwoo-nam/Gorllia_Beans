import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/data/data_source/cart_data_source.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final dataSource = CartDataSource();

  @override
  Future<Result<List<CartInfo>>> getCartData() async {
    return dataSource.getCartData();
  }

  @override
  Future<void> addCartData(CartInfo info) async {
    dataSource.addCartData(info);
  }

  @override
  Future<void> deleteCartData(int index) async {
    dataSource.deleteCartData(index);
  }

  @override
  Future<void> updateCartData(int index, CartInfo info) async {
    dataSource.updateCartData(index, info);
  }
}
