import 'exceptions.dart';
import 'failures.dart';

Failure handleException(Exception e) {
  if (e is ServerException) return ServerFailure();
  if (e is CacheException) return CacheFailure();
  return ServerFailure();
}
