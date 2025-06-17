import 'package:talket/domain/model/authen/login_request.dart';

import '../../utils/typedefs.dart';
import '../model/authen/login_response.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<LoginResponse?> login(LoginRequest request);
}
