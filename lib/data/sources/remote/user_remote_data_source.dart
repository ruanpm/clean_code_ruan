import 'package:clean_code_ruan/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserModel> getUser(String id) async {
    // Simulate a network request
    await Future.delayed(Duration(seconds: 1));
    return UserModel(id: id, name: 'John Doe', email: 'john.doe@example.com');
  }
}
