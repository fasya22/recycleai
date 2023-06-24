import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycleai/theme/color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class RegisterView extends GetView<RegisterController> {
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: bodyHeight * 0.4,
                width: mediaQueryWidth * 0.7,
                child: Image.asset('assets/images/login.png'),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: bodyHeight * 0.7,
                width: mediaQueryWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Let\'s Join Us! ',
                          style: TextStyle(
                              fontSize: 24,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Take the first step to be part of the solution',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.username,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your username';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Username',
                        hintText: 'Masukan Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.email,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your email';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Email',
                        hintText: 'Masukan Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        obscureText: controller.obscureTextPassword.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscureTextPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              controller.toglePasswordVisibility();
                            },
                          ),
                          labelText: 'Password',
                          hintText: 'Masukan Password',
                          prefixIcon: Icon(Icons.lock_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Obx(
                    //   () => TextField(
                    //     controller: controller.re_password,
                    //     obscureText: controller.obscureTextRePassword.value,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           width: 2,
                    //           color: Colors.black45,
                    //         ),
                    //       ),
                    //       suffixIcon: IconButton(
                    //         icon: Icon(
                    //           controller.obscureTextRePassword.value
                    //               ? Icons.visibility
                    //               : Icons.visibility_off,
                    //           color: Colors.black45,
                    //         ),
                    //         onPressed: () {
                    //           controller.togleRePasswordVisibility();
                    //         },
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           width: 2,
                    //           color: Colors.black45,
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           width: 2,
                    //           color: Colors.black45,
                    //         ),
                    //       ),
                    //       hintText: "Verify your password",
                    //       labelText: "Verify password",
                    //       labelStyle: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.black45,
                    //       ),
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       prefixIcon: Container(
                    //         margin: const EdgeInsets.all(16),
                    //         padding: const EdgeInsets.only(right: 12),
                    //         decoration: BoxDecoration(
                    //           border: Border(
                    //             right: BorderSide(
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ),
                    //         child: Icon(
                    //           Icons.verified_user,
                    //           color: Colors.black45,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Get.toNamed(Routes.DASHBOARD);
                          await controller.register();
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Center(
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Container(
                    //         width: 70,
                    //         height: 1,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xff49454f),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Center(
                    //         child: Text(
                    //           'Or',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w400,
                    //             height: 1.4285714286,
                    //             letterSpacing: 0.1000000015,
                    //             color: Color(0xff49454f),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    //         width: 70,
                    //         height: 1,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xff222222),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // SizedBox(
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () => Get.toNamed(Routes.DASHBOARD),
                    //     child: Text(
                    //       'Sign Up With Google',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.white),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: primaryColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
