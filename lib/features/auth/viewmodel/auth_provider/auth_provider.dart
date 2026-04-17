import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms/data/local/db_helper.dart';
import 'package:lms/features/auth/data/repository/auth_repository.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(DatabaseHelper.instance);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AuthState());

  Future<void> checkAuthStatus() async {
    state = state.copyWith(isLoading: true);
    final user = await _repository.getLoggedInUser();
    if (user != null) {
      state = state.copyWith(status: AuthStatus.authenticated, user: user, isLoading: false, clearError: true);
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, isLoading: false, clearUser: true, clearError: true);
    }
  }

  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = await _repository.login(email: email, password: password);
      state = state.copyWith(status: AuthStatus.authenticated, user: user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = await _repository.register(name: name, email: email, phone: phone, password: password);
      state = state.copyWith(pendingUser: user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> confirmSession() async {
    final pending = state.pendingUser;
    if (pending == null || pending.id == null) return;
    await _repository.confirmSession(pending.id!);
    state = state.copyWith(
      status: AuthStatus.authenticated,
      user: pending.copyWith(isLoggedIn: 1),
      clearPending: true,
    );
  }

  Future<void> logout() async {
    await _repository.logout();
    state = state.copyWith(status: AuthStatus.unauthenticated, clearUser: true, clearPending: true, clearError: true);
  }
}

