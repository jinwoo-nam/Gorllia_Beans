import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  Future<DocumentReference> saveCartInfoToFireStore(
      List<CartInfo> infos) async {
    var now = DateTime.now();

    double totalPrice = 0;
    double price = 0;
    List<Map<String, dynamic>> temp = [];
    for (final data in infos) {
      price = data.productInfo.price *
          data.count *
          ((100 - data.productInfo.dcRate) / 100);

      totalPrice += price;
      temp.add({
        'name': data.productInfo.name,
        'count': data.count,
        'price': price,
      });
    }

    return await FirebaseFirestore.instance
        .collection('cart_info')
        .add(<String, dynamic>{
      'data': temp,
      'timestamp':
      '${now.year}/${now.month}/${now.day} ${now.hour}:${now.minute}:${now
          .second}',
      '배송료': (totalPrice > 20000) ? 0 : 2500
    });
  }
}
