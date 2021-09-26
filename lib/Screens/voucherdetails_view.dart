import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/vouchers_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherDetailsView extends StatefulWidget {
   late final String logo,code,model,offer,name;

   VoucherDetailsView(this.logo, this.code, this.model, this.offer, this.name);

  @override
  _VoucherDetailsViewState createState() => _VoucherDetailsViewState();
}

class _VoucherDetailsViewState extends State<VoucherDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: InkWell(onTap: ()=>Get.to(VouchersView()),child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text(
          "Vouchers",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0,bottom: 30,left: 15,right: 15),
          child: Card(
            color: Colors.white,
            child:Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(widget.model,height: 200,width: 200,),
                  SizedBox(height: 10,),
                  Image.network(widget.logo,height: 50,width: 100,),
                  CustomText(text:widget.name,fontWeight: FontWeight.bold,color: Colors.black45,alignment: Alignment.center,fontSize: 22,),
                  SizedBox(height: 10,),
                  CustomText(text: widget.offer,fontWeight: FontWeight.bold,color: Colors.black,alignment: Alignment.center,fontSize: 32,),
                  SizedBox(height: 10,),
                  Text( 'Tap offer to copy the coupon Code.\nRemember to paste code when you checkout.Online\nOnly',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,),textAlign: TextAlign.center,),
                  SizedBox(height: 15,),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                  CustomText(text: '------------------------',color: primaryColor,),
                  CustomText(text: ' Copy paste this code ',color: Colors.black45,fontSize: 12,),
                  CustomText(text: '------------------------',color: primaryColor,),
                  ],),
                  SizedBox(height: 35,),
                  Text(widget.code,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 32,letterSpacing: 7)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
