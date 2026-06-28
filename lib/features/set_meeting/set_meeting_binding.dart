import 'package:get/get.dart';
import 'set_meeting_controller.dart';
import 'set_meeting_repository.dart';

class SetMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISetMeetingRepository>(() => SetMeetingRepositoryImpl());
    Get.lazyPut(() => SetMeetingController(Get.find<ISetMeetingRepository>()));
  }
}
