import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/repository/cart_repository.dart';

class GetCartDataUseCase {
  CartRepository repository;

  GetCartDataUseCase(this.repository);

  Future<Result<List<CartInfo>>> call() async {
    return await repository.getCartData();
  }
}
