
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopapp/core/service/address_database_helper.dart';
import 'package:eshopapp/core/service/firestore_user.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:eshopapp/Screens/control_view.dart';
import 'package:eshopapp/widgets/summary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../Constants/constance.dart';
import 'cart_view_model.dart';

class CheckOutViewModel extends GetxController{
  int _processIndex = 0;
  int get index=>_processIndex;
  Pages get pages=>_pages;
  Pages _pages = Pages.DeliveryTime;
  List<AddressInfo> get addressInfo=>_addressInfo;
  List<AddressInfo> _addressInfo=[];
  var street1,street2,city,state,country,phoneNumber;
  GlobalKey<FormState> formstate=GlobalKey();
  CheckOutViewModel(){
    getAllProducts( );
  }
  getAllProducts()async{
    var dbHelper=addressDatabaseHelper.db;
    _addressInfo=await dbHelper.getAllProdcut();
    update();
  }

  void changeIndex(int i){
    if(i==0||i<0){
      _pages=Pages.DeliveryTime;
      _processIndex=i;
    }
    else if(i==1){
      _pages=Pages.AddAddress;
      _processIndex=i;
    }
   else if(i==2){
      // Get.to(Summary());
      _processIndex=i;

    }
    else if(i>2){
      // Get.to(Summary());
      _processIndex=i;
    }

    update();
  }

  Color getColor(int i) {
    if (i == _processIndex) {
      return inProgressColor;
    } else if (i < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  addtoaddresslist(AddressInfo addressInfo)async{
    _addressInfo.add(addressInfo);
    var dbHelper=addressDatabaseHelper.db;
    await dbHelper.insert(addressInfo);
    update();
  }
}