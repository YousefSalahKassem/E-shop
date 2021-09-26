
import 'package:eshopapp/core/view_model/auth_view_model.dart';
import 'package:eshopapp/Screens/register_view.dart';

import 'package:eshopapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome,",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomText(
                      text: 'Email',
                      fontSize: 14,
                      color: Colors.grey.shade900,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error');
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'user@gmail.com',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    CustomText(
                      text: 'Password',
                      fontSize: 14,
                      color: Colors.grey.shade900,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error');
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '***********',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Colors.white,
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 15,
                ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10),
                onPressed: (){  _formKey.currentState!.save();

                if (_formKey.currentState!.validate()) {
                  controller.signInWithEmailAndPassword();
                }},
                color: primaryColor,
                child: CustomText(
                  alignment: Alignment.center,
                  text: 'Sign IN',
                  color: Colors.white,
                ),
              ),

                SizedBox(
                  height: 40,
                ),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  onPressed: (){controller.googleSignInMethod();},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset('images/google.png'),
                      SizedBox(
                        width: 100,
                      ),
                      CustomText(
                        text: 'Sign In With Google',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
