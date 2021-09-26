import 'package:eshopapp/core/view_model/home_view_model.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'control_view.dart';

class NotificationsView extends StatefulWidget {


  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}


class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: InkWell(onTap: ()=>Get.to(ControlView()),child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller)=> ListView.separated(itemBuilder: (context,index){return Container(
          padding: EdgeInsets.only(top: 10),
          height: 330,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Image.network(controller.notification[index].image,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18.0),
              child: Container(height: 40,color: Colors.grey.shade200,child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CustomText(text: controller.notification[index].title,alignment: Alignment.centerLeft,fontWeight: FontWeight.bold,color: Colors.black54,),
              ),),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
              child: Container(color: Colors.grey.shade200,child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0,left: 15.0,right: 18),
                child: Text(controller.notification[index].description),
              ))
            )
          ],),
        );}, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 35,
          );
        }, itemCount: controller.notification.length),
      ),
    );
  }


}
