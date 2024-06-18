import 'package:clean_code_ruan/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel?> getUser(String id);
  void cacheUser(UserModel user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Map<String, UserModel> _cache = {};

  @override
  Future<UserModel?> getUser(String id) async {
    return _cache[id];
  }

  @override
  void cacheUser(UserModel user) {
    _cache[user.id] = user;
  }
}
