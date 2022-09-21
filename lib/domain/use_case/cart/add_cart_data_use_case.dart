import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/repository/cart_repository.dart';

class AddCartDataUseCase {
  CartRepository repository;

  AddCartDataUseCase(
    this.repository,
  );

  Future<void> call(CartInfo info) async {
    await repository.addCartData(info);
  }
}
