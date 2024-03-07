import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';

abstract class UserRepository {
  Future<Either<ApiException, String>> login({required String email, required String password});
  Future<Either<ApiException, String>> getUserId();
  Future<Either<ApiException, String>> register({required String email, required String password});
  Future<Either<ApiException, void>> logOut();
  Future<Either<ApiException, Map<String, dynamic>>> getUserData({required String idToken});
}
