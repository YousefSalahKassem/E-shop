import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/delevery_time.dart';
import 'package:eshopapp/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';

class AddAddress extends StatefulWidget {
  late String type;
  late double price;
  AddAddress({required this.type,required this.price});
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
   int value=0;

  @override
  Widget build(BuildContext context) {
    return
                Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    title: Text(
                      "Address",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      SizedBox(height: 60,),
                      Expanded(
                        child: GetBuilder<CheckOutViewModel>(
                          init: Get.find<CheckOutViewModel>(),
                          builder: (controller) =>controller.addressInfo.length==0? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('images/carto.svg',width: 200,height: 200),
                              SizedBox(height: 10,),
                              CustomText(text: 'No Addresses',alignment: Alignment.center,color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500,)
                            ],
                          ) : Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return
                                  RadioListTile(activeColor: primaryColor,value: index, groupValue: value, onChanged: (int? ind){setState(() {
                                    value=ind!;
                                  });},
                                    title:CustomText(
                                      text: 'Home Address',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    subtitle:
                                    Container(
                                    width: 350,
                                child: Text(
                                controller.addressInfo[index].street1+' , '+controller.addressInfo[index].street2+' , '+controller.addressInfo[index].state+' , '+controller.addressInfo[index].country+' , '+controller.addressInfo[index].city+'\n'+controller.addressInfo[index].phone,
                                style:TextStyle(color: Colors.black,
                                fontSize: 15,),
                                maxLines: 5,
                                )));

                              },

                              itemCount: controller.addressInfo.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 25,
                                );
                              },
                            ),
                          ),

                        ),
                      ),
                      Container(
                          width: 400, padding: EdgeInsets.only(top: 200,bottom: 20),
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
                                  onPressed: (){Get.to(DeliveryTime());},
                                  color: Colors.white,
                                  child: CustomText(
                                    alignment: Alignment.center,
                                    text: 'Back',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GetBuilder<CheckOutViewModel>(
                                init: Get.find<CheckOutViewModel>(),
                                builder:(controller)=> Align(
                                  alignment: Alignment.topRight,
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.only(top:20,bottom: 20,left: 70,right: 70),
                                    onPressed: (){if(controller.addressInfo.length==0){
                                      Get.snackbar('No Addresses', 'Please fill address to continue the process!',snackPosition: SnackPosition.BOTTOM);
                                    }else{
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Summary(ind: value,price: widget.price,type: widget.type,)));}},
                                    color: primaryColor,
                                    child: CustomText(
                                      alignment: Alignment.center,
                                      text: 'NEXT',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                );
  }
}