import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/domain/usecase/authen/login_use_case.dart';

import '../../providers/login_provider.dart';
import '../../repository/authen_repo.dart';

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) {
    final AuthenticationRepository authenticationRepository =
        ref.watch(authRepositoryProvider);
    return LoginUseCase(authenticationRepository);
  },
);
