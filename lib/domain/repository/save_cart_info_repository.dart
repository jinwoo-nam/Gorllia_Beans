import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SaveCartInfoRepository {
  Future<DocumentReference> saveCartInfoToFireStore(List<CartInfo> infos);
}
