import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';
import 'control_view.dart';
import 'daetilas_view.dart';

class SeeMore extends StatelessWidget {

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
          "Best Selling",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<HomeViewModel>(
        builder:(controller)=> Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              itemCount: controller.productModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsView(
                      model: controller.productModel[index],
                    ));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          child: Container(
                              child: Image.network(
                                controller.productModel[index].image,
                                fit: BoxFit.fill,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: controller.productModel[index].name,
                                alignment: Alignment.bottomLeft,
                              ),

                              CustomText(
                                text: controller.productModel[index].description,
                                color: Colors.grey,
                                alignment: Alignment.bottomLeft,
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

                      ],
                    ),
                  ),
                );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio:  MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height ),
            ),

            ),
          ),
        ),
      ),
    );
  }
}
