import '../../data/dao/user_dao.dart';
import '../../data/models/user_model.dart';
import '../../data/network/error_handler.dart';
import '../../data/network/resource.dart';

abstract class IHomeRepository {
  Future<Resource<UserModel>> fetchUserProfile(String userId);
}

class HomeRepositoryImpl implements IHomeRepository {
  final UserDao _userDao;

  HomeRepositoryImpl(this._userDao);

  @override
  Future<Resource<UserModel>> fetchUserProfile(String userId) async {
    try {
      final result = await _userDao.getUserProfile(userId);
      return ResourceSuccess(result);
    } catch (e) {
      return ResourceError(ErrorHandler.getErrorMessage(e));
    }
  }
}
