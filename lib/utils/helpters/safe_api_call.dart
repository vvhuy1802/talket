import 'package:dartz/dartz.dart';

import '../../data/network/exceptions/http_exception.dart';
import '../../domain/model/response.dart' as response;
import '../typedefs.dart';

ResultFuture<T> safeApiCall<T>(
  Future<Either<AppException, response.Response>> Function() request, {
  required T Function(dynamic data) onSuccess,
}) async {
  try {
    final response = await request();
    return response.fold(
      (failure) => Left(failure),
      (success) {
        try {
          final parsed = onSuccess(success.data);
          return Right(parsed);
        } catch (e) {
          return Left(AppException(
            message: 'Failed to parse response',
            statusCode: success.statusCode,
            identifier: 'safeApiCall<T>',
          ));
        }
      },
    );
  } catch (e) {
    return Left(
      AppException(
        message: 'Unexpected exception',
        statusCode: -1,
        identifier: 'safeApiCall<T>: ${e.toString()}',
      ),
    );
  }
}
