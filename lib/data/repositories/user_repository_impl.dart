import 'package:clean_code_ruan/data/sources/local/user_local_data_source.dart';
import 'package:clean_code_ruan/data/sources/remote/user_remote_data_source.dart';
import 'package:clean_code_ruan/domain/entities/user.dart';
import 'package:clean_code_ruan/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> getUser(String id) async {
    try {
      final user = await remoteDataSource.getUser(id);
      localDataSource.cacheUser(user);
      return user;
    } catch (e) {
      return (await localDataSource.getUser(id))!;
    }
  }
}
