import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';

abstract class DatabaseRepository {
  Future<Either<ApiException, Map<String, dynamic>>> get(
      {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers});
  Future<Either<ApiException, String>> put(
      {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers});
}
