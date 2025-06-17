import 'package:talket/domain/model/authen/login_request.dart';
import 'package:talket/domain/model/authen/login_response.dart';
import 'package:talket/domain/repository/authen_repo.dart';
import 'package:talket/domain/usecase/use_case.dart';
import 'package:talket/utils/typedefs.dart';

class LoginUseCase extends UseCaseWithParams<LoginRequest, LoginResponse?> {
  const LoginUseCase(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<LoginResponse?> call(LoginRequest params) => _repo.login(params);
}
