import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/constance.dart';
import '../Screens/my_addresses.dart';
import 'custom_text.dart';

class AddMyAddresses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Shipping Address",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder:(controller)=> Form(
        child: SingleChildScrollView(
          key: controller.formstate,
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: CustomText(text: 'Billing address is the same as delivery address.',maxLine: 2,fontSize: 20,alignment: Alignment.center,),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    children: [

                      CustomText(
                        text: 'PhoneNumber',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      TextField(

                        onChanged: (value) {
                          controller.phoneNumber=value;
                        },

                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    children: [

                      CustomText(
                        text: 'Street 1',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      TextField(

                        onChanged: (value) {
                          controller.street1=value;
                        },

                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Street 2',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      TextField(

                        onChanged: ( value) {
                          controller.street2=value;
                        },

                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    children: [

                      CustomText(
                        text: 'City',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      TextField(

                        onChanged: (value) {
                          controller.city=value;
                        },

                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Column(
                            children: [

                              CustomText(
                                text: 'State',
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              TextField(
                                onChanged: (value) {
                                  controller.state=value;
                                },

                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Column(
                            children: [

                              CustomText(
                                text: 'Country',
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              TextField(
                                onChanged: (value) {
                                  controller.country=value;
                                },

                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 10,bottom: 10),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.all(10),
                            onPressed: () {
                              controller.addtoaddresslist(AddressInfo(street1: controller.street1, street2: controller.street2, state: controller.state, city: controller.city, country: controller.country, phone: controller.phoneNumber));

                              Get.to(MyAddresses());},
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomText(
                                text: 'Save',
                                color: Colors.white,
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
        ),
      ),
    ),);
  }
}
