import 'package:eshopapp/core/service/address_database_helper.dart';
import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/Screens/control_view.dart';
import 'package:eshopapp/widgets/add_myaddress.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';
import 'checkout_view.dart';

class MyAddresses extends StatefulWidget {


  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(onTap: ()=>Get.to(ControlView()),child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          title: Text(
            "Shipping Address",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body:
        Column(
          children: [
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
                  child:
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction){
                          
                            addressDatabaseHelper.db.deleteproduct(controller.addressInfo[index].street1);
                            controller.addressInfo.removeAt(index);
                        },
                          key: UniqueKey(), child:
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        height: 140,
                        child: Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Home Address',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 350,
                                    child: Text(

                                      controller.addressInfo[index].street1+' , '+controller.addressInfo[index].street2+' , '+controller.addressInfo[index].state+' , '+controller.addressInfo[index].country+' , '+controller.addressInfo[index].city,
                                      style:TextStyle(color: Colors.black,
                                        fontSize: 15,),
                                      maxLines: 5,


                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                   controller.addressInfo[index].phone,
                                    style:TextStyle(color: Colors.black,
                                      fontSize: 15,),
                                    maxLines: 5,


                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));

                    },

                    itemCount: controller.addressInfo.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Container(
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    GetBuilder<CheckOutViewModel>(
                      init: Get.find<CheckOutViewModel>(),
                      builder:(controller)=> Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 10),
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            Get.to(AddMyAddresses());
                              },
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomText(
                              alignment: Alignment.center,
                              text: 'Add',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
