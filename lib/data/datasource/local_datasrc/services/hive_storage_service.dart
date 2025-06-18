import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talket/data/datasource/local_datasrc/services/storage_service.dart';

class HiveStorageService implements StorageService {
  static const String _boxName = 'talket_storage';
  Box<String>? _box;

  @override
  bool get hasInitialized => _box != null;

  @override
  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    _box = await Hive.openBox<String>(_boxName);
  }

  Box<String> get _requireBox {
    if (_box == null) {
      throw Exception('HiveStorageService not initialized. Call init() first.');
    }
    return _box!;
  }

  @override
  Future<Object?> get(String key) async {
    return _requireBox.get(key);
  }

  @override
  Future<bool> has(String key) async {
    return _requireBox.containsKey(key);
  }

  @override
  Future<bool> set(String key, String data) async {
    await _requireBox.put(key, data);
    return true;
  }

  @override
  Future<bool> remove(String key) async {
    await _requireBox.delete(key);
    return true;
  }

  @override
  Future<void> clear() async {
    await _requireBox.clear();
  }
}
