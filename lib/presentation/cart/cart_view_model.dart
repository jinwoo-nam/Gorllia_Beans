import 'dart:async';

import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/use_case/cart/add_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/delete_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/get_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/update_cart_data_use_case.dart';
import 'package:beans_instapay/presentation/cart/cart_state.dart';
import 'package:beans_instapay/presentation/home/product/drop_box_event.dart';
import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  final GetCartDataUseCase getCartData;
  final AddCartDataUseCase addCartData;
  final DeleteCartDataUseCase deleteCartData;
  final UpdateCartDataUseCase updateCartData;

  CartViewModel({
    required this.getCartData,
    required this.addCartData,
    required this.deleteCartData,
    required this.updateCartData,
  }) {
    fetchData();
  }

  CartState _state = CartState();

  CartState get state => _state;

  void fetchData() async {
    final cart = await getCartData();

    cart.when(success: (data) {
      _state = state.copyWith(
        cartInfo: data,
      );
    }, error: (String message) {
      print('error');
    });
    notifyListeners();
  }

  void addCart(CartInfo cart) async {
    await addCartData(cart);
    notifyListeners();
  }

  void deleteCart(int index) async {
    await deleteCartData(index);
    notifyListeners();
  }

  void updateCart(int index, CartInfo cart) async {
    await updateCartData(index, cart);
    notifyListeners();
  }

  int getSumOfProduct() {
    int sum = 0;
    int dcPrice = 0;
    for (int i = 0; i < state.cartInfo.length; i++) {
      dcPrice = (state.cartInfo[i].productInfo.price *
              ((100 - state.cartInfo[i].productInfo.dcRate) / 100))
          .ceil();
      sum += (dcPrice * state.cartInfo[i].count);
    }
    return sum;
  }

}
