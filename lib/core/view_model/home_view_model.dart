
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopapp/core/service/home_services.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/category_model.dart';
import 'package:eshopapp/model/notification_model.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:eshopapp/model/product_model.dart';
import 'package:eshopapp/model/voucher_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  List<OrderModels> get orderModel => _orderModel;
  List<OrderModels> _orderModel=[] ;

  List<CartProductModel> get cart => _cart;
  List<CartProductModel> _cart=[] ;

  List<NotificationsModel> get notification => _notification;
  List<NotificationsModel> _notification=[] ;

  List<VoucherModel> get vouchers => _vouchers;
  List<VoucherModel> _vouchers=[] ;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
    getOrders();
    getNotifications();
    getVouchers();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }

  Future getOrders() async {
    HomeService().getOrders().then((List<QueryDocumentSnapshot<Object?>>value) {
      for (int i = 0; i < value.length; i++) {
       if(value[i]['userId']==FirebaseAuth.instance.currentUser!.uid.toString())
          _orderModel.add(OrderModels.fromMap(value[i].data() as Map<dynamic,dynamic>));
      }
      update();
    });
  }

  getNotifications()async{
    HomeService().getNotifications().then((value) {
      for(int i=0;i<value.length;i++){
        _notification.add(NotificationsModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        print(value[i].data().toString());
      }

      update();
    });
  }

    getVouchers()async{
      HomeService().getVouchers().then((value) {
        for(int i=0;i<value.length;i++){
          if(value[i]['userId']==FirebaseAuth.instance.currentUser!.uid.toString()) {
            _vouchers.add(VoucherModel.fromJson(
                value[i].data() as Map<dynamic, dynamic>));
          }
        }

        update();
      });
    }

  }
