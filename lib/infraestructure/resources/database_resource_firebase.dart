import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/resources/resources.dart';
import 'package:felicitup/infraestructure/providers/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatabaseResourceFirebase implements DatabaseResource {
  DatabaseResourceFirebase(this._ref);
  final Ref _ref;
  @override
  Future<Either<ApiException, Map<String, dynamic>>> get(
      {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers}) async {
    try {
      if (queryparameters != null) {
        final data = await _ref.read(firestoreProvider).collection(path).doc(queryparameters['doc']).get();
        if (data.data() != null) {
          return Right(data.data()!);
        } else {
          return const Right({});
        }
      } else {
        final data = await _ref.read(firestoreProvider).collection(path).get();
        if (data.docs.isNotEmpty) {
          final dataReturn = data.docs.map((e) => e.data()).toList();
          return Right({'data': dataReturn});
        } else {
          return const Right({});
        }
      }
    } on FirebaseException catch (e) {
      Log().error(e.message!);
      return Left(ApiException(400, e.message!));
    } catch (e) {
      Log().error(e);
      return Left(ApiException(400, e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> put(
      {required String path, Map<String, dynamic>? queryparameters, Map<String, dynamic>? headers}) async {
    try {
      await _ref.read(firestoreProvider).collection(path).doc(queryparameters!['doc']).set(queryparameters['body']);
      return const Right('');
    } on FirebaseException catch (e) {
      Log().error(e.message!);
      return Left(ApiException(400, e.message!));
    } catch (e) {
      Log().error(e);
      return Left(ApiException(400, e.toString()));
    }
  }
}
