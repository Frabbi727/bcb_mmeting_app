import 'package:get/get.dart';
import '../../data/network/resource.dart';
import 'set_meeting_repository.dart';

class SetMeetingController extends GetxController {
  final ISetMeetingRepository _repository;

  SetMeetingController(this._repository);

  final RxBool isLoading = false.obs;
  final RxString statusMessage = ''.obs;

  Future<void> scheduleMeeting(String title, DateTime date) async {
    isLoading.value = true;
    statusMessage.value = '';

    final resource = await _repository.scheduleMeeting(title, date);
    
    switch (resource) {
      case ResourceSuccess():
        statusMessage.value = 'Meeting scheduled successfully!';
      case ResourceError(errorMessage: final message):
        statusMessage.value = 'Failed to schedule: $message';
      case ResourceLoading():
        break;
    }

    isLoading.value = false;
  }
}
