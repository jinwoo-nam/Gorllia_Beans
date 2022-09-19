import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/use_case/cart/add_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/delete_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/get_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/update_cart_data_use_case.dart';
import 'package:beans_instapay/presentation/cart/cart_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    cart.when(
        success: (data) {
          _state = state.copyWith(
            cartInfo: data,
          );
        },
        error: (String message) {});
    notifyListeners();
  }

  Future<bool> addCart(CartInfo cart) async {
    bool check = false;
    bool countOverflow = false;
    int newCount = 0;
    for (int i = 0; i < _state.cartInfo.length; i++) {
      if (_state.cartInfo[i].productInfo.name == cart.productInfo.name) {
        if (cart.productInfo.isBean == false) {
          check = true;
          if (_state.cartInfo[i].count + cart.count > 10) {
            newCount = 10;
            countOverflow = true;
          } else {
            newCount = _state.cartInfo[i].count + cart.count;
          }
          updateCart(
              i, CartInfo(productInfo: cart.productInfo, count: newCount));
          break;
        } else if (cart.beanType == _state.cartInfo[i].beanType) {
          check = true;
          if (_state.cartInfo[i].count + cart.count > 10) {
            newCount = 10;
            countOverflow = true;
          } else {
            newCount = _state.cartInfo[i].count + cart.count;
          }
          updateCart(
              i,
              CartInfo(
                  productInfo: cart.productInfo,
                  count: newCount,
                  beanType: cart.beanType));
          break;
        }
      }
    }
    if (check == false) {
      await addCartData(cart);
    }
    notifyListeners();
    return countOverflow;
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

  Future<DocumentReference> saveCartInfoToFireStore(
      List<CartInfo> infos) async {
    List<Map<String, dynamic>> temp = [];
    for (final data in infos) {
      temp.add({
        'name': data.productInfo.name,
        'count': data.count,
      });
    }

    return await FirebaseFirestore.instance
        .collection('cart_info')
        .add(<String, dynamic>{
      'data': temp,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
