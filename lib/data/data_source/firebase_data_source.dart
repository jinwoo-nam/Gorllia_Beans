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
      String bean = '';
      if (data.beanType != null) {
        if (data.beanType == BeanType.Whole) {
          bean = '홀빈';
        } else {
          bean = '드립용';
        }
      }

      temp.add({
        'name': data.productInfo.name,
        'count': data.count,
        'price': price,
        'beanType': bean,
      });
    }

    final String timestamp =
        '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    return await FirebaseFirestore.instance
        .collection('cart_info')
        .add(<String, dynamic>{
      'data': temp,
      'timestamp': timestamp,
      '배송료': (totalPrice > 20000) ? 0 : 2500
    });
  }
}
