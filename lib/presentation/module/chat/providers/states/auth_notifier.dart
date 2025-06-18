import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/domain/usecase/authen/login_use_case.dart';

import '../../../../../domain/model/authen/login_request.dart';
import '../../../../../domain/repository/authen_repo.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier({
    required this.loginUseCase,
  }) : super(const AuthState.initial());

  Future<void> loginUser(String email, String password) async {
    state = const AuthState.loading();
    final response = await loginUseCase(LoginRequest(
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
