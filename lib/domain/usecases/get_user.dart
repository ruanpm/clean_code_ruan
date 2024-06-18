import 'package:clean_code_ruan/domain/entities/user.dart';
import 'package:clean_code_ruan/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User> execute(String id) {
    return repository.getUser(id);
  }
}
