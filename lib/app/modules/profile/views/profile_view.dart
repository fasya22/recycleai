import 'package:recycleai/app/routes/app_pages.dart';
import 'package:recycleai/theme/color.dart';
import 'package:recycleai/utils/prefs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/src/painting/gradient.dart';
import '../../../../theme/string.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(30),
              child: Icon(
                Icons.person_outline,
                color: primaryColor,
                size: 80,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "${controller.name.value}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "${controller.email.value}",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Obx((){
            //   return Text(
            //   "${controller.email.value}",
            //   style: TextStyle(fontSize: 14, color: Colors.grey),
            // );
            // }),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.UPDATE_PROFILE),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Reset Password',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Are you sure ?'),
                          content: const Text('Do you want to logout ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Prefs.deleteToken();
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
