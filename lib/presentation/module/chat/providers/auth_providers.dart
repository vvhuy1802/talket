import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/domain/usecase/authen/login_use_case.dart';
import 'package:talket/presentation/module/chat/providers/states/auth_notifier.dart';
import 'package:talket/presentation/module/chat/providers/states/auth_state.dart';

import '../../../../domain/usecase/providers/login_use_case_provider.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final LoginUseCase loginUseCase = ref.watch(loginUseCaseProvider);
    return AuthNotifier(
      loginUseCase: loginUseCase,
    );
  },
);
