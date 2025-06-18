import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/data/datasource/remote_datasrc/authen_remote_data_src.dart';

import '../../data/datasource/remote_datasrc/providers/auth_data_src_provider.dart';
import '../../data/network/network_service.dart';
import '../../data/providers/dio_network_service_provider.dart';
import '../../data/repository/authen_repo_impl.dart';
import '../repository/authen_repo.dart';

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    final AuthenticationRemoteDataSource dataSource =
        ref.watch(authDataSourceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
