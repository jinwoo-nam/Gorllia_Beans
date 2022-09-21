import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
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
