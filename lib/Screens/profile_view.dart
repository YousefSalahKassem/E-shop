import 'package:eshopapp/core/view_model/control_view_model.dart';
import 'package:eshopapp/Screens/login_view.dart';
import 'package:eshopapp/Screens/my_addresses.dart';
import 'package:eshopapp/Screens/notications_view.dart';
import 'package:eshopapp/Screens/order_history.dart';
import 'package:eshopapp/widgets/custom_text.dart';
import 'package:eshopapp/widgets/vouchers_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0,left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:
                  Row(
                    children: [
                      Container(width: 100,height: 100,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString()),fit: BoxFit.fill),color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(100)
                      ),
                      )
                      ),
                      SizedBox(width: 20,),
                      Column(children: [
                        CustomText( text: FirebaseAuth.instance.currentUser!.displayName.toString(),fontSize: 25,color: Colors.black,),
                        SizedBox(height: 10,),
                        CustomText( text: FirebaseAuth.instance.currentUser!.email.toString(),fontSize: 15,color: Colors.black,),
                      ],)
                    ],
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  child:
                  FlatButton(onPressed: (){Get.to(VouchersView());}, child: ListTile(title: CustomText(text:'Vouchers'),leading: Container(child: Padding(padding: EdgeInsets.all(8),child: Icon(Icons.card_giftcard,color: Colors.black,)),color: Color(0xffE1F6EB),),horizontalTitleGap: 20,contentPadding:EdgeInsets.only(right: 30),trailing: Icon(Icons.navigate_next),)),

                ),
                SizedBox(height: 10,),
                Container(
                  child:
                  FlatButton(onPressed: (){Get.to(MyAddresses());}, child: ListTile(title: CustomText(text:'Shipping Address'),leading: Image.asset('images/Icon_Location.png'),horizontalTitleGap: 20,contentPadding:EdgeInsets.only(right: 30),trailing: Icon(Icons.navigate_next),)),

                ),
                SizedBox(height: 10,),
                Container(
                  child:
                  FlatButton(onPressed: (){Get.to(OrderHistoryView());}, child: ListTile(title: CustomText(text:'Order History'),leading: Image.asset('images/Icon_History.png'),horizontalTitleGap: 20,contentPadding:EdgeInsets.only(right: 30),trailing: Icon(Icons.navigate_next),)),

                ),

                SizedBox(height: 10,),
                Container(
                  child:
                  FlatButton(onPressed: (){Get.to(NotificationsView());}, child: ListTile(title: CustomText(text:'Notifications'),leading: Image.asset('images/Icon_Location.png'),horizontalTitleGap: 20,contentPadding:EdgeInsets.only(right: 30),trailing: Icon(Icons.navigate_next),)),

                ),
                SizedBox(height: 10,),
                Container(
                  child: FlatButton(onPressed: (){FirebaseAuth.instance.signOut();Get.offAll(LoginView());}, child: ListTile(title: CustomText(text:'Log Out'),leading: Image.asset('images/Icon_Exit.png'),horizontalTitleGap: 20,contentPadding:EdgeInsets.only(right: 30),trailing: Icon(Icons.navigate_next),)),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
