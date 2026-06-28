import '../../data/network/resource.dart';

abstract class ISetMeetingRepository {
  Future<Resource<bool>> scheduleMeeting(String title, DateTime date);
}

class SetMeetingRepositoryImpl implements ISetMeetingRepository {
  @override
  Future<Resource<bool>> scheduleMeeting(String title, DateTime date) async {
    try {
      // Mock network transaction
      await Future.delayed(const Duration(milliseconds: 1000));
      return const ResourceSuccess(true);
    } catch (e) {
      return ResourceError(e.toString());
    }
  }
}
