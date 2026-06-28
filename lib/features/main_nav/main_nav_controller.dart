import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../set_meeting/set_meeting_view.dart';

class TabItem {
  final Widget view;
  final String titleKey;
  final IconData icon;

  TabItem({
    required this.view,
    required this.titleKey,
    required this.icon,
  });
}

class MainNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  // Managed list of tabs to maintain dynamic structure
  final List<TabItem> tabs = [
    TabItem(
      view: const HomeView(),
      titleKey: 'tab_home',
      icon: Icons.home,
    ),
    TabItem(
      view: const SetMeetingView(),
      titleKey: 'tab_set_meeting',
      icon: Icons.add_circle_outline,
    ),
    TabItem(
      view: const ProfileView(),
      titleKey: 'tab_profile',
      icon: Icons.person_outline,
    ),
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
