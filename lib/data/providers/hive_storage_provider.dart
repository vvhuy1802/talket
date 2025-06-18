import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talket/data/datasource/local_datasrc/services/hive_storage_service.dart';

final hiveServiceProvider = Provider((ref) {
  final HiveStorageService hiveStorageService = HiveStorageService();
  hiveStorageService.init();
  return hiveStorageService;
});
