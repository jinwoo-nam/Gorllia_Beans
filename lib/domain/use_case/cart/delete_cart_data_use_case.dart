import 'package:beans_instapay/domain/repository/cart_repository.dart';

class DeleteCartDataUseCase {
  CartRepository repository;

  DeleteCartDataUseCase(this.repository);

  Future<void> call(int index) async {
    await repository.deleteCartData(index);
  }
}