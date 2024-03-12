import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/repositories/repositories.dart';
import 'package:felicitup/domain/resources/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userResource);
  final UserResource _userResource;
  @override
  Future<Either<ApiException, String>> getUserId() => _userResource.getUserId();

  @override
  Future<Either<ApiException, void>> logOut() => _userResource.logOut();

  @override
  Future<Either<ApiException, String>> login(
          {required String email, required String password}) =>
      _userResource.login(email: email, password: password);

  @override
  Future<Either<ApiException, String>> register(
          {required String email, required String password}) =>
      _userResource.register(email: email, password: password);

  @override
  Future<Either<ApiException, Map<String, dynamic>>> getUserData(
          {required String idToken}) =>
      _userResource.getUserData(idToken: idToken);

  @override
  Future<Either<ApiException, UserCredential>> signInWithGoogle() async =>
      _userResource.signInWithGoogle();
}
