import '../../data/dao/user_dao.dart';
import '../../data/network/error_handler.dart';
import '../../data/network/resource.dart';

abstract class ILoginRepository {
  Future<Resource<Map<String, dynamic>>> authenticate(String email, String password);
}

class LoginRepositoryImpl implements ILoginRepository {
  final UserDao _userDao;

  LoginRepositoryImpl(this._userDao);

  @override
  Future<Resource<Map<String, dynamic>>> authenticate(String email, String password) async {
    try {
      final result = await _userDao.login(email, password);
      return ResourceSuccess(result);
    } catch (e) {
      return ResourceError(ErrorHandler.getErrorMessage(e));
    }
  }
}
