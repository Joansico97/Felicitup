import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/resources/resources.dart';
import 'package:felicitup/infraestructure/providers/database_provider.dart';
import 'package:felicitup/infraestructure/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserResourceFirebase implements UserResource {
  UserResourceFirebase(this._ref);
  final Ref _ref;
  @override
  Future<Either<ApiException, String>> getUserId() async {
    try {
      final user = _ref.read(authFirebaseProvider).currentUser;
      if (user != null) {
        return Right(user.uid);
      } else {
        return const Right('');
      }
    } on FirebaseAuthException catch (e) {
      return Left(ApiException(400, e.message!));
    } catch (e) {
      return Left(ApiException(400, e.toString()));
    }
  }

  @override
  Future<Either<ApiException, void>> logOut() async {
    try {
      await _ref.read(authFirebaseProvider).signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ApiException(400, e.message!));
    } catch (e) {
      return Left(ApiException(400, e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> login(
      {required String email, required String password}) async {
    try {
      await _ref
          .read(authFirebaseProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      return const Right('');
    } on FirebaseAuthException catch (e) {
      return Left(ApiException(400, e.message!));
    } catch (e) {
      return Left(ApiException(400, e.toString()));
    }
  }

  @override
  Future<Either<ApiException, String>> register(
      {required String email, required String password}) async {
    try {
      final res = await _ref
          .read(authFirebaseProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      Log().debug(res.credential!.asMap());
      return const Right('');
    } on FirebaseAuthException catch (e) {
      return Left(ApiException(400, e.message!));
    } catch (e) {
      return Left(ApiException(400, e.toString()));
    }
  }

  @override
  Future<Either<ApiException, Map<String, dynamic>>> getUserData(
      {required String idToken}) async {
    Log().debug('traigo la info');
    return const Right({});
  }

  @override
  Future<Either<ApiException, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final response = await _ref
          .read(authFirebaseProvider)
          .signInWithCredential(credential);

      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(ApiException(400, e.message!));
    } catch (e) {
      return Left(ApiException(400, e.toString()));
    }
  }
}
