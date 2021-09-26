import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/widgets/add_address.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/delevery_time.dart';
import 'package:eshopapp/widgets/summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import '../Constants/constance.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder:(controller)=> Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end  ,
            children: [
              Container(
                height: 100,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _processes.length,
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
              // controller.pages == Pages.DeliveryTime
              //     ? DeliveryTime()
              //     : controller.pages == Pages.AddAddress
              //     ? AddAddress()
              //     : Summary(),
              Container(
                width: 400, padding: EdgeInsets.only(top: 100,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   controller.index==0?Container():
                   Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(

                        shape: new RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor),
                          borderRadius: new BorderRadius.circular(5.0),
                        ),

                        padding: EdgeInsets.only(top:20,bottom: 20,left: 70,right: 70),
                        onPressed: (){controller.changeIndex(controller.index-1);},
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
                        onPressed: (){controller.changeIndex(controller.index+1);},
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

      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
];