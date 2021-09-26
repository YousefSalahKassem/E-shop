import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/core/service/cart_database_helper.dart';
import 'package:eshopapp/core/service/firestore_user.dart';
import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:eshopapp/model/product_model.dart';
import 'package:eshopapp/Screens/checkout_view.dart';
import 'package:eshopapp/widgets/add_address.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/delevery_time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Screens/control_view.dart';

class Summary extends StatefulWidget {
  late final int ind;
  late final String type;
  late final double price;

  Summary({required this.ind, required this.type, required this.price});

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  var dbHelper = CartDataBaseHelper.db;
  int fee = 10;

  late List<CartProductModel> list;

  late final String ind;

  late CartProductModel cart;

  late String percent = '0';
  TextEditingController offer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showWidget = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "CheckOut",
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomText(
                text: 'My Cart',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            GetBuilder<CartViewModel>(
              init: Get.find<CartViewModel>(),
              builder: (controller) => Column(
                children: [
                  Container(
                    height: 280,
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.cartProductModel.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Container(
                            width: 150,
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 180,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: controller.cartProductModel[index].name,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text:
                                          '\$${controller.cartProductModel[index].price}',
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                    CustomText(
                                      text: 'X' +
                                          controller
                                              .cartProductModel[index].quantity
                                              .toString(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(text: 'Size:'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CustomText(
                                            text: controller
                                                .cartProductModel[index].size),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(text: 'Color:'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CustomText(
                                            text: controller
                                                .cartProductModel[index].color),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                    child: CustomText(
                      text: 'Shipping Address',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GetBuilder<CheckOutViewModel>(
                      builder: (controller) => Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              '${controller.addressInfo[widget.ind].street1}' +
                                  ', ' +
                                  '${controller.addressInfo[widget.ind].street2}' +
                                  ', ' +
                                  '${controller.addressInfo[widget.ind].state}' +
                                  ', ' +
                                  '${controller.addressInfo[widget.ind].city}' +
                                  ', ' +
                                  '${controller.addressInfo[widget.ind].country}' +
                                  '.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              maxLines: 5,
                            ),
                          )),
                  SizedBox(
                    height: 60,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomText(
                      text: 'Phone Number',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<CheckOutViewModel>(
                      builder: (controller) => Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 90, top: 5),
                          child: CustomText(
                            text: controller.addressInfo[widget.ind].phone,
                            fontSize: 18,
                          ))),
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomText(
                      text: 'Add Voucher',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 10, top: 5),
                          child: TextFormField(
                            controller: offer,
                            decoration: InputDecoration(
                              hintText: 'AD256*****',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                              ),
                            ),
                          )),
                      GetBuilder<HomeViewModel>(
                        init: Get.find<HomeViewModel>(),
                        builder: (controllers) => Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20, right: 20),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              side: BorderSide(color: primaryColor),
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              setState(() {
                                for (int i = 0;
                                    i < controllers.vouchers.length;
                                    i++) {
                                  if (offer.text.toString() ==
                                      controllers.vouchers[i].code) {
                                    int ind = i;
                                    percent =
                                        controllers.vouchers[ind].percentage;
                                    showWidget = !showWidget;
                                    Get.snackbar(
                                        'Successfully process',
                                        'your offer are added in your order with ' +
                                            percent +
                                            '% discount on your order!',
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    Get.snackbar(
                                        'Failed process', 'Invalid code!',
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                }
                              });
                            },
                            color: Colors.white,
                            child: CustomText(
                              alignment: Alignment.center,
                              text: 'Apply',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomText(
                      text: 'Payment summary',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomText(
                                text: 'Cart Total',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GetBuilder<CartViewModel>(
                                  init: Get.find<CartViewModel>(),
                                  builder: (controller) => CustomText(
                                        text: '\$${controller.totalprice}',
                                      )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomText(
                                text: widget.type,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GetBuilder<CartViewModel>(
                                  init: Get.find<CartViewModel>(),
                                  builder: (controller) => CustomText(
                                        text: '\$${widget.price}',
                                      )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomText(
                                text: 'Delivery fee',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GetBuilder<CartViewModel>(
                                  init: Get.find<CartViewModel>(),
                                  builder: (controller) => CustomText(
                                        text: '\$${fee.toString()}',
                                      )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      showWidget
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: CustomText(
                                      text: 'Offer',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: GetBuilder<CartViewModel>(
                                        init: Get.find<CartViewModel>(),
                                        builder: (controller) => CustomText(
                                            text: percent + '%',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ],
                              ))
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomText(
                                text: 'Total amount',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GetBuilder<CartViewModel>(
                                  init: Get.find<CartViewModel>(),
                                  builder: (controller) => CustomText(
                                      text:
                                          '\$${(controller.totalprice + fee + widget.price) - (controller.totalprice + fee + widget.price) * (int.parse(percent) / 100)}',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<CheckOutViewModel>(
                      init: Get.find<CheckOutViewModel>(),
                      builder: (cont) => Container(
                            width: 400,
                            padding: EdgeInsets.only(top: 40, bottom: 20),
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    side: BorderSide(color: primaryColor),
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 70, right: 70),
                                  onPressed: () {
                                    Get.to(DeliveryTime());
                                  },
                                  color: Colors.white,
                                  child: CustomText(
                                    alignment: Alignment.center,
                                    text: 'Back',
                                    color: Colors.black,
                                  ),
                                ),
                                FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 70, right: 70),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('orders')
                                        .doc()
                                        .set(OrderModel(
                                                userId: FirebaseAuth
                                                    .instance.currentUser!.uid
                                                    .toString(),
                                                dateTime: DateFormat.yMMMMd()
                                                    .format(DateTime.now())
                                                    .toString(),
                                                street1: cont
                                                    .addressInfo[widget.ind]
                                                    .street1,
                                                street2: cont
                                                    .addressInfo[widget.ind]
                                                    .street2,
                                                state: cont
                                                    .addressInfo[widget.ind]
                                                    .state,
                                                city: cont
                                                    .addressInfo[widget.ind]
                                                    .city,
                                                country: cont
                                                    .addressInfo[widget.ind]
                                                    .country,
                                                phone: cont
                                                    .addressInfo[widget.ind]
                                                    .phone,
                                                products: controller.cartProductModel
                                                    .toList())
                                            .toMap());
                                    controller.deleteproduct();
                                    controller.cartProductModel.length = 0;
                                    FirebaseFirestore.instance
                                        .collection('Vouchers')
                                        .where('code',
                                            isEqualTo: offer.text.toString())
                                        .get()
                                        .then((value) => value
                                            .docs.first.reference
                                            .delete());
                                    Get.offAll(ControlView());
                                  },
                                  color: primaryColor,
                                  child: CustomText(
                                    alignment: Alignment.center,
                                    text: 'Checkout',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
