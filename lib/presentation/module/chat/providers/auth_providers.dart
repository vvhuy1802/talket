import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/presentation/module/chat/providers/states/auth_notifier.dart';
import 'package:talket/presentation/module/chat/providers/states/auth_state.dart';

import '../../../../data/datasource/remote_datasrc/authen_remote_data_src.dart';
import '../../../../data/network/network_service.dart';
import '../../../../domain/providers/login_provider.dart';
import '../../../../domain/repository/authen_repo.dart';

final authDataSourceProvider =
    Provider.family<AuthenticationRemoteDataSource, NetworkService>(
  (_, networkService) => AuthenticationRemoteDataSourceImpl(networkService),
);

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final AuthenticationRepository authenticationRepository =
        ref.watch(authRepositoryProvider);
    return AuthNotifier(
      authRepository: authenticationRepository,
    );
  },
);
