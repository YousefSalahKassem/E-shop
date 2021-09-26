import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:eshopapp/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
  final CollectionReference _orderCollectionRef =
  FirebaseFirestore.instance.collection('orders');

  Future<void> addOrderToFireStore(OrderModel userModel) async {
    return await _orderCollectionRef
        .doc(userModel.userId)
        .set(userModel.toMap());
  }
}
