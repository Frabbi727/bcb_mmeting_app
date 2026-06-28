import 'package:get/get.dart';
import '../home/home_binding.dart';
import '../profile/profile_binding.dart';
import '../set_meeting/set_meeting_binding.dart';
import 'main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavController());
    
    // Pre-bind sub-tab DI dependencies to support dynamic lazy loading
    HomeBinding().dependencies();
    SetMeetingBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
