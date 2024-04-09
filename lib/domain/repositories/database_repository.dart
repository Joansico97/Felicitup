import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';

abstract class DatabaseRepository {
  Future<Either<ApiException, Map<String, dynamic>>> get({
    required String collection,
    required String document,
  });
  Future<Either<ApiException, String>> put({
    required String collection,
    required String document,
    required Map<String, dynamic> data,
  });
}
