import 'package:beans_instapay/data/data_source/firebase_data_source.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/repository/save_cart_info_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveCartInfoRepositoryImpl implements SaveCartInfoRepository {
  final dataSource = FirebaseDataSource();

  @override
  Future<DocumentReference<Object?>> saveCartInfoToFireStore(
      List<CartInfo> infos) async {
    return await dataSource.saveCartInfoToFireStore(infos);
  }
}
