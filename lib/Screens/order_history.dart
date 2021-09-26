import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';
import 'control_view.dart';

class OrderHistoryView extends StatefulWidget {
  @override
  _OrderHistoryViewState createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
            onTap: () => Get.to(ControlView()),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Order History",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<HomeViewModel>(
              init: Get.find<HomeViewModel>(),
              builder: (controller) => controller.orderModel.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/carto.svg',
                            width: 200, height: 200),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'No Order History',
                          alignment: Alignment.center,
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return
                            Column(
                              children: [
                                Container(
                                padding: EdgeInsets.only(left: 10, top:10),
                                height: 310,
                                child: Row(
                                  children: [
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:<Widget> [
                                          Divider(thickness: 50,height: 10,color: Colors.red,),

                                          CustomText(
                                            text: controller
                                                .orderModel[index].dateTime,
                                          ),
                                          GetBuilder<HomeViewModel>(
                                            init: Get.find<HomeViewModel>(),
                                            builder: (controller) =>
                                               Container(
                                                height: 274,
                                                child: ListView.separated(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: controller
                                                      .orderModel[index]
                                                      .products
                                                      .length,
                                                  itemBuilder: (context, ind) {
                                                    return Container(
                                                      child: Container(
                                                        width: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 10.0),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 150,
                                                                height: 180,
                                                                child:
                                                                Image.network(
                                                                  controller
                                                                      .orderModel[
                                                                  index]
                                                                      .products[
                                                                  ind]['image'],
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              CustomText(
                                                                text: controller
                                                                    .orderModel[
                                                                index]
                                                                    .products[
                                                                0]['name'],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  CustomText(
                                                                    text:
                                                                    '\$${controller.orderModel[index].products[ind]['price']}',
                                                                    color:
                                                                    primaryColor,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    alignment: Alignment
                                                                        .bottomLeft,
                                                                  ),
                                                                  CustomText(
                                                                    text: 'X' +
                                                                        controller
                                                                            .orderModel[
                                                                        index]
                                                                            .products[
                                                                        ind]
                                                                        [
                                                                        'quantity']
                                                                            .toString(),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      CustomText(
                                                                          text:
                                                                          'Size:'),
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      CustomText(
                                                                          text: controller
                                                                              .orderModel[
                                                                          index]
                                                                              .products[ind]['size']),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      CustomText(
                                                                          text:
                                                                          'Color:'),
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      CustomText(
                                                                          text: controller
                                                                              .orderModel[
                                                                          index]
                                                                              .products[ind]['color']),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                      int ind) {
                                                    return SizedBox(
                                                      width: 20,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),

                                        ],
                                      ),

                                  ],
                                ),
                          ),
                              ],
                            );
                        },
                        itemCount: controller.orderModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
