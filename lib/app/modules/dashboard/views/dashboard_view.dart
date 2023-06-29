import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycleai/app/modules/home/views/home_view.dart';
import 'package:recycleai/app/modules/detection/views/detection_view.dart';
import 'package:recycleai/app/modules/graph/views/graph_view.dart';
import 'package:recycleai/app/modules/profile/views/profile_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                DetectionView(),
                GraphView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.green,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                Icon: ImageIcon(
                  AssetImage('assets/icons/icon_home.png'),
                ),
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                Icon: ImageIcon(
                  AssetImage('assets/icons/icon_detection.png'),
                ),
                label: 'Detection',
              ),
              _bottomNavigationBarItem(
                Icon: ImageIcon(
                  AssetImage('assets/icons/icon_graph.png'),
                ),
                label: 'Graph',
              ),
              _bottomNavigationBarItem(
                Icon: ImageIcon(
                  AssetImage('assets/icons/icon_user.png'),
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({Icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon,
      label: label,
    );
  }
}
