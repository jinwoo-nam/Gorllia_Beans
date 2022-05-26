import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/repository/cart_repository.dart';

class UpdateCartDataUseCase {
  CartRepository repository;

  UpdateCartDataUseCase(this.repository);

  Future<void> call(int index, CartInfo info) async {
    await repository.updateCartData(index, info);
  }
}
