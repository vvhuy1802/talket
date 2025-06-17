import 'package:get_it/get_it.dart';
import 'package:talket/data/network/dio_network_service.dart';

import '../data/repository/authen_repo_impl.dart';
import '../domain/repository/authen_repo.dart';
import '../domain/usecase/authen/login_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initNetwork();
  await _initRepositories();
  await _initUseCases();
}

Future<void> _initNetwork() async {
  sl.registerLazySingleton(() => DioNetworkService(sl()));
}

Future<void> _initRepositories() async {
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(sl()),
  );
}

Future<void> _initUseCases() async {
  sl.registerLazySingleton(() => LoginUseCase(sl()));
}
