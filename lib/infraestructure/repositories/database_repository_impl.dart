import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/repositories/repositories.dart';
import 'package:felicitup/domain/resources/resources.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this._databaseResource);

  final DatabaseResource _databaseResource;
  @override
  Future<Either<ApiException, Map<String, dynamic>>> get(
          {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers}) async =>
      _databaseResource.get(path: path, queryparameters: queryparameters, headers: headers);

  @override
  Future<Either<ApiException, String>> put(
          {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers}) async =>
      _databaseResource.put(path: path, queryparameters: queryparameters, headers: headers);
}
