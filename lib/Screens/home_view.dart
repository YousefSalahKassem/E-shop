
import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/Screens/cart_view.dart';
import 'package:eshopapp/Screens/see_more.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';
import 'daetilas_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller)=>
           Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GetBuilder<CartViewModel>(init: Get.find<CartViewModel>(),builder:(con)=>
                       Padding(
                         padding: const EdgeInsets.only(right: 20.0,top: 40.0),
                         child:con.cartProductModel.length!=0?
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            InkWell(onTap: ()=>Get.to(CartView()),child: Icon(Icons.shopping_cart,color: primaryColor,)),
                            Container(height: 10,width:10,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(100.0),),child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomText(text:'',color: Colors.white,),
                            )),
                          ],
                      ):CustomText(text: '',)
                       ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          _searchTextFormField(),
                          SizedBox(
                            height: 30,
                          ),
                          CustomText(
                            text: "Categories",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _listViewCategory(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Best Selling",
                                fontWeight: FontWeight.bold,

                                fontSize: 18,
                              ),
                              InkWell(onTap:()=> Get.to(SeeMore()),
                                child: CustomText(
                                  text: "See all",
                                  fontWeight: FontWeight.bold,

                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _listViewProducts(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 280,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),

                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),

                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
