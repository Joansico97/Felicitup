import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/repositories/repositories.dart';
import 'package:felicitup/domain/resources/resources.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this._databaseResource);

  final DatabaseResource _databaseResource;

  @override
  Future<Either<ApiException, Map<String, dynamic>>> get(
      {required String collection, required String document}) async {
    return _databaseResource.get(collection: collection, document: document);
  }

  @override
  Future<Either<ApiException, String>> put(
      {required String collection,
      required String document,
      required Map<String, dynamic> data}) async {
    return _databaseResource.put(
        collection: collection, document: document, data: data);
  }
}
