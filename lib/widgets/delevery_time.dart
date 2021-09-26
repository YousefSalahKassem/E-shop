import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/Screens/control_view.dart';
import 'package:eshopapp/widgets/add_address.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery _delivery=Delivery.StandardDelivery;
  late String type;
  late double price;
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Delivery Time",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            SizedBox(height: 50,),
            RadioListTile<Delivery>(value: Delivery.StandardDelivery, groupValue: _delivery, onChanged: (Delivery? value){setState(() {
              _delivery=value!;
            });},
              title: CustomText(text: 'Standard Delivery',fontSize: 24,fontWeight: FontWeight.bold,),
              subtitle: CustomText(text: '\nOrder will be delivered between 3 - 5 business days.',fontWeight: FontWeight.normal,maxLine: 3,)
              ,activeColor: primaryColor,),
            SizedBox(height: 60,),
            RadioListTile<Delivery>(value: Delivery.NextDayDelivery, groupValue: _delivery, onChanged: (value){setState(() {
              _delivery=value!;
            });},
              title: CustomText(text: 'Next Day Delivery',fontSize: 24,fontWeight: FontWeight.bold,),
              subtitle: CustomText(text: '\nPlace your order before 6pm and your items will be delivered the next day.',maxLine: 3,fontWeight: FontWeight.normal,)
              ,activeColor: primaryColor,),
            SizedBox(height: 120,),
            Container(
                width: 400, padding: EdgeInsets.only(top: 200,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(

                        shape: new RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor),
                          borderRadius: new BorderRadius.circular(5.0),
                        ),

                        padding: EdgeInsets.only(top:20,bottom: 20,left: 70,right: 70),
                        onPressed: (){Get.to(ControlView());},
                        color: Colors.white,
                        child: CustomText(
                          alignment: Alignment.center,
                          text: 'Back',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.only(top:20,bottom: 20,left: 70,right: 70),
                        onPressed: (){
                          if(_delivery==Delivery.StandardDelivery){
                            price=10;
                            type='Standard Delivery';}
                          else {price=20;
                          type='Next Day Delivery';}
                            Get.to(AddAddress(type: type,price: price,));
                          },
                        color: primaryColor,
                        child: CustomText(
                          alignment: Alignment.center,
                          text: 'NEXT',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],

    ),
        ),

      );
  }
}