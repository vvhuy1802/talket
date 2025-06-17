import '../../utils/typedefs.dart';

abstract class UseCaseWithParams<Params, Type> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}
