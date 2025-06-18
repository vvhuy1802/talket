import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../network/network_service.dart';
import '../authen_remote_data_src.dart';

final authDataSourceProvider =
    Provider.family<AuthenticationRemoteDataSource, NetworkService>(
  (_, networkService) => AuthenticationRemoteDataSourceImpl(networkService),
);
