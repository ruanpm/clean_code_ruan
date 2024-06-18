import 'package:flutter/foundation.dart';
import 'package:clean_code_ruan/domain/entities/user.dart';
import 'package:clean_code_ruan/domain/usecases/get_user.dart';

class UserProvider with ChangeNotifier {
  final GetUser getUser;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserProvider({required this.getUser});

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadUser(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await getUser.execute(id);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
