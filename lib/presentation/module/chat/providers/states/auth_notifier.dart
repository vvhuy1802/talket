import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/data/datasource/local_datasrc/user/user_local_data_src.dart';
import 'package:talket/domain/usecase/authen/login_use_case.dart';

import '../../../../../domain/model/authen/login_request.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final UserDataSource userDataSource;

  AuthNotifier({
    required this.loginUseCase,
    required this.userDataSource,
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
        //save user info to local
        userDataSource.saveUser(user: user?.user);
        return AuthState.success(user);
      },
    );
  }

  void reset() {
    state = const AuthState.initial();
  }
}
