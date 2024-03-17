import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<Either<ApiException, String>> login({
    required String email,
    required String password,
  });
  Future<Either<ApiException, String>> getUserId();
  Future<Either<ApiException, String>> register({
    required String email,
    required String password,
  });
  Future<Either<ApiException, void>> logOut();
  Future<Either<ApiException, Map<String, dynamic>>> getUserData({
    required String idToken,
  });
  Future<Either<ApiException, UserCredential>> signInWithGoogle();
  // Future<Either<ApiException, void>> updateUserData({required String idToken, required Map<String, dynamic> data});
  // Future<Either<ApiException, void>> updatePassword({required String idToken, required String password});
  // Future<Either<ApiException, void>> resetPassword({required String email});
  // Future<Either<ApiException, void>> deleteAccount({required String idToken});
  // Future<Either<ApiException, void>> sendEmailVerification({required String idToken});
  // Future<Either<ApiException, void>> verifyEmail({required String idToken});
}
