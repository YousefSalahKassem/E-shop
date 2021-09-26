
import 'dart:ui';

import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/helper/extenstion.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/product_model.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';

// ignore: must_be_immutable
class DetailsView extends StatefulWidget {
  ProductModel model;

  DetailsView({required this.model});


  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  var dropdownValue;
  var drop;
  @override
  void initState() {
    super.initState();
    dropdownValue=widget.model.sized[0];
    drop=widget.model.color[0];
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                widget.model.background,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child:
                  Column(
                    children: [
                      CustomText(
                        text: widget.model.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                DropdownButton<String>(value: dropdownValue,icon: Icon(Icons.arrow_drop_down),iconSize: 20,elevation: 16,onChanged: (var value) {setState(() {
                                  dropdownValue=value!;
                                });},items:  widget.model.sized.map<DropdownMenuItem<String>>((var value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(fontWeight: FontWeight.bold)),
                                  );
                                }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),

                                DropdownButton<String>(value: drop,icon: Icon(Icons.arrow_drop_down),iconSize: 20,elevation: 16,onChanged: (var value) {setState(() {
                                  drop=value!;

                                });},items:  widget.model.color.map<DropdownMenuItem<String>>((var value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child:   Text(value,style: TextStyle(fontWeight: FontWeight.bold),)
                                  );
                                }).toList(),
                                ),

                               
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(widget.model.description,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 2.5),)

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "PRICE ",
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: CustomText(
                            text: '\$' + widget.model.price,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),
                        )
                      ],
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.find<CartViewModel>(),
                      builder:(controller)=> Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(16),
                        width: 150,
                        height: 80,
                        child: FlatButton(
                          onPressed: () {

                            controller.addProduct(CartProductModel(name: widget.model.name, image: widget.model.image, price: widget.model.price, quantity: 1,id: widget.model.id,size: dropdownValue,color: drop));
                            Navigator.of(context).pop();
                          },
                          child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          color: primaryColor,
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
