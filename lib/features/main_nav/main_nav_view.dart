import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final activeTab = controller.tabs[controller.currentIndex.value];
      return Scaffold(
        appBar: CustomAppBar(
          title: activeTab.titleKey.tr,
          showBackButton: false,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.map((tab) => tab.view).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          items: controller.tabs.map((tab) {
            return BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.titleKey.tr,
            );
          }).toList(),
        ),
      );
    });
  }
}
