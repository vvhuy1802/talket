import 'package:get_it/get_it.dart';
import 'package:talket/data/network/dio_network_service.dart';
import 'package:talket/utils/helpters/logging_helper.dart';

import '../data/repository/authen_repo_impl.dart';
import '../domain/repository/authen_repo.dart';
import '../domain/usecase/authen/login_use_case.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _initNetwork();
  await _initRepositories();
  await _initUseCases();
  await _initLogger();
}

Future<void> _initNetwork() async {
  getIt.registerLazySingleton(() => DioNetworkService(getIt()));
}

Future<void> _initRepositories() async {
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(getIt()),
  );
}

Future<void> _initUseCases() async {
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
}

Future<void> _initLogger() async {
  getIt.registerLazySingleton(() => LoggingHelper());
}
