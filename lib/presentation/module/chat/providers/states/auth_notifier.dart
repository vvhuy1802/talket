import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/model/authen/login_request.dart';
import '../../../../../domain/repository/authen_repo.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(const AuthState.initial());

  Future<void> loginUser(String email, String password) async {
    state = const AuthState.loading();
    final response = await authRepository.login(LoginRequest(
      email: email,
      password: password,
    ));

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        return AuthState.success(user);
      },
    );
  }
}
