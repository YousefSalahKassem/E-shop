import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference _ordersCollectionRef =
  FirebaseFirestore.instance.collection('orders');

  final CollectionReference _notificationCollectionRef =
  FirebaseFirestore.instance.collection('Notifications');

  final CollectionReference _vouchersCollectionRef =
  FirebaseFirestore.instance.collection('Vouchers');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getOrders() async {
    var value = await _ordersCollectionRef.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getNotifications() async {
    var value = await _notificationCollectionRef.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getVouchers() async {
    var value = await _vouchersCollectionRef.get();
    return value.docs;
  }

}
