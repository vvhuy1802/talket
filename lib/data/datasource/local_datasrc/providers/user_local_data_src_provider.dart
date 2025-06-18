import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/hive_storage_provider.dart';
import '../services/hive_storage_service.dart';
import '../user/user_local_data_src.dart';

final userLocalDataSourceProvider = Provider<UserDataSource>(
  (ref) {
    final HiveStorageService hiveStorageService =
        ref.watch(hiveServiceProvider);
    return UserDataSourceImpl(hiveStorageService);
  },
);
