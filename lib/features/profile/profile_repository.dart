import 'package:get/get.dart';
import '../../data/local/local_storage.dart';

abstract class IProfileRepository {
  Future<void> logout();
}

class ProfileRepositoryImpl implements IProfileRepository {
  final LocalStorageService _storage = Get.find<LocalStorageService>();

  @override
  Future<void> logout() async {
    await _storage.clearSession();
  }
}
