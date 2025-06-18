import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:talket/data/datasource/local_datasrc/services/storage_service.dart';
import 'package:talket/utils/helpters/logging_helper.dart';
import 'package:talket/utils/typedefs.dart';

import '../../../../core/globals.dart';
import '../../../../di/injection_container.dart';
import '../../../../domain/model/authen/login_response.dart';
import '../../../network/exceptions/http_exception.dart';

abstract class UserDataSource {
  String get storageKey;

  ResultFuture<User> fetchUser();

  Future<bool> saveUser({required User? user});

  Future<bool> deleteUser();

  Future<bool> hasUser();
}

class UserDataSourceImpl implements UserDataSource {
  final StorageService storageService;

  UserDataSourceImpl(this.storageService);

  LoggingHelper logger = getIt.get<LoggingHelper>();

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  ResultFuture<User> fetchUser() async {
    try {
      final hasUser = await storageService.has(storageKey);
      if (!hasUser) {
        return Future.error(AppException(message: 'No user found.'));
      }

      final raw = await storageService.get(storageKey);
      if (raw == null || raw is! String) {
        return Future.error(AppException(message: 'Invalid user data.'));
      }

      final json = jsonDecode(raw);
      final user = User.fromJson(json);

      logger.info(user);

      return Right(user);
    } catch (e) {
      return Future.error(AppException(message: e.toString()));
    }
  }

  @override
  Future<bool> saveUser({required User? user}) async {
    try {
      if (user == null) {
        return false;
      }
      final json = jsonEncode(user.toJson());
      logger.info(user.toJson());
      return await storageService.set(storageKey, json);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      return await storageService.remove(storageKey);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> hasUser() {
    return storageService.has(storageKey);
  }
}
