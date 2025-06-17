import 'package:talket/domain/model/authen/login_response.dart';

import '../../../domain/model/authen/login_request.dart';
import '../../../utils/helpters/safe_api_call.dart';
import '../../../utils/typedefs.dart';
import '../../network/network_service.dart';

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  ResultFuture<LoginResponse> login(LoginRequest request);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImpl(this._networkService);

  final NetworkService _networkService;

  @override
  ResultFuture<LoginResponse> login(LoginRequest request) {
    return safeApiCall(
      () => _networkService.post('/auth/login', data: request.toJson()),
      onSuccess: (data) {
        final loggedInUser = LoginResponse.fromJson(data);

        _networkService.updateHeader({
          'Authorization': loggedInUser.accessToken,
        });

        return loggedInUser;
      },
    );
  }
}
