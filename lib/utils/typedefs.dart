import 'package:dartz/dartz.dart';

import '../data/network/exceptions/http_exception.dart';

typedef ResultFuture<T> = Future<Either<AppException, T>>;
