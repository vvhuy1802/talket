import 'package:talket/data/datasource/remote_datasrc/authen_remote_data_src.dart';
import 'package:talket/domain/model/authen/login_request.dart';
import 'package:talket/domain/model/authen/login_response.dart';
import 'package:talket/utils/typedefs.dart';

import '../../domain/repository/authen_repo.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  const AuthenticationRepositoryImpl(this._dataSrc);

  final AuthenticationRemoteDataSource _dataSrc;

  @override
  ResultFuture<LoginResponse?> login(LoginRequest request) async {
    return _dataSrc.login(request);
  }
}
