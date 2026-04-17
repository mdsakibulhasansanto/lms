import 'package:lms/data/local/db_helper.dart';
import 'package:lms/features/auth/data/model/user_model.dart';

class AuthRepository {
  final DatabaseHelper _dbHelper;

  AuthRepository(this._dbHelper);

  Future<UserModel?> getLoggedInUser() async {
    return await _dbHelper.getLoggedInUser();
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final exists = await _dbHelper.emailExists(email);
    if (exists) throw Exception('email_already_exists');
    final user = UserModel(name: name, email: email, phone: phone, password: password);
    final id = await _dbHelper.insertUser(user);
    return user.copyWith(id: id);
  }

  Future<UserModel> login({required String email, required String password}) async {
    final user = await _dbHelper.getUserByEmail(email);
    if (user == null) throw Exception('user_not_found');
    if (user.password != password) throw Exception('wrong_password');
    await _dbHelper.clearAllSessions();
    await _dbHelper.setLoggedIn(user.id!);
    return user.copyWith(isLoggedIn: 1);
  }

  Future<void> confirmSession(int userId) async {
    await _dbHelper.clearAllSessions();
    await _dbHelper.setLoggedIn(userId);
  }

  Future<void> logout() async {
    await _dbHelper.clearAllSessions();
  }
}

