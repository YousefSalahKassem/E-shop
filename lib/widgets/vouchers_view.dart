import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/Screens/voucherdetails_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/control_view.dart';

class VouchersView extends StatefulWidget {

  @override
  _VouchersViewState createState() => _VouchersViewState();
}

class _VouchersViewState extends State<VouchersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: InkWell(onTap: ()=>Get.to(ControlView()),child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text(
          "Vouchers",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:
      Container(
        color: Colors.grey.shade200,
        child: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder:(controller)=> ListView.separated(itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(5.0),child: InkWell(onTap:()=> Get.to(VoucherDetailsView(controller.vouchers[index].logo, controller.vouchers[index].code, controller.vouchers[index].image, controller.vouchers[index].offer, controller.vouchers[index].name)),child: Image.network(controller.vouchers[index].background))),
            );

          }, separatorBuilder: (BuildContext context,int index){return SizedBox(height: 0,);}, itemCount: controller.vouchers.length),
        ),
      ),
    );
  }
}
