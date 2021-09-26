
import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/Screens/checkout_view.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/delevery_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find<CartViewModel>(),
              builder: (controller) =>controller.cartProductModel.length==0? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/carto.svg',width: 200,height: 200),
                  SizedBox(height: 10,),
                  CustomText(text: 'Cart Empty',alignment: Alignment.center,color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500,)
                ],
              ) : Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                              width: 140,
                              child: Image.network(
                                controller.cartProductModel[index].image,
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartProductModel[index].name,
                                  fontSize: 25,
                                ),
                                SizedBox(
                                  height: 6,
                                ),

                                CustomText(
                                  text:
                                      '\$${controller.cartProductModel[index].price.toString()}',
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 130,
                                  color: Colors.grey.shade200,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.increaseQuntity(index);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        alignment: Alignment.center,
                                        fontSize: 20,
                                        color: Colors.black,
                                        text: controller
                                            .cartProductModel[index].quantity
                                            .toString(),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                          padding:
                                              EdgeInsets.only(bottom: 20.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.decreaseQuntity(index);
                                            },

                                            child: Icon(
                                              Icons.minimize,
                                              color: Colors.black,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.cartProductModel.length,
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
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'TOTAL',
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        GetBuilder<CartViewModel>(
                          init: Get.find<CartViewModel>(),
                          builder: (controller) => CustomText(
                            text: '\$${controller.totalprice}',
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find<CartViewModel>(),
                    builder: (controller) => InkWell(
                      onTap: () {
                        controller.deleteproduct();
                        controller.cartProductModel.length=0;
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find<CartViewModel>(),
                    builder:(controller)=> Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          if(controller.cartProductModel.length==0)
                            Get.snackbar('Cart Empty', 'You need to add some items !',snackPosition: SnackPosition.BOTTOM);
                          else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryTime()));}},
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomText(
                            alignment: Alignment.center,
                            text: 'CHECKOUT',
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
    );
  }
}
