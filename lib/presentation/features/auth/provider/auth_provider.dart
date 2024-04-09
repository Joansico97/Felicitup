import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/infraestructure/providers/auth_provider.dart';
import 'package:felicitup/infraestructure/providers/database_provider.dart';
import 'package:felicitup/infraestructure/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

final authProvider = StateNotifierProvider<AuthFeatureEvents, AuthFeatureModel>(
  (ref) => AuthFeatureEvents(ref),
);

@freezed
class AuthFeatureModel with _$AuthFeatureModel {
  const factory AuthFeatureModel({
    required bool isObscure,
    required bool isRepObscure,
    required bool checkTerms,
    required bool isLoading,
    required bool isValidate,
    required String birthDate,
  }) = _AuthFeatureModel;

  factory AuthFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$AuthFeatureModelFromJson(json);
}

class AuthFeatureEvents extends StateNotifier<AuthFeatureModel> {
  AuthFeatureEvents(this.ref)
      : super(
          const AuthFeatureModel(
            isObscure: true,
            isRepObscure: true,
            checkTerms: false,
            isLoading: false,
            isValidate: false,
            birthDate: '',
          ),
        );

  final Ref ref;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime date = DateTime.now();

  void changeObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void changeRepObscure() {
    state = state.copyWith(isRepObscure: !state.isRepObscure);
  }

  bool checkTerms() {
    state = state.copyWith(checkTerms: true);
    return state.checkTerms;
  }

  Future<void> goToRegister() async {
    await ref.watch(routerProvider).pushNamed(RouterPaths.register);
  }

  Future<void> goToLogin() async {
    await ref.watch(routerProvider).pushNamed(RouterPaths.login);
  }

  void changeView() {
    state = state.copyWith(isValidate: true);
  }

  Future<void> showSchedule() async {
    DateTime? newDate = await showDatePicker(
      context: rootNavigatorKey.currentContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: ((context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.lightGrey,
            ),
            focusColor: AppColors.red,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.red,
              ),
            ),
          ),
          child: child!,
        );
      }),
    );

    if (newDate == null) return;

    date = newDate;
    state = state.copyWith(birthDate: '${date.day}/${date.month}/${date.year}');
  }

  Future<void> registerProccess() async {
    if (passwordController.text.isNotEmpty &&
        repeatPasswordController.text.isNotEmpty &&
        passwordController.text == repeatPasswordController.text &&
        emailController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        state.birthDate != '') {
      await goToTermsPage();
    } else {
      ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(
            'Debe completar todos los campos',
            style: AppStyles.bodyS.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );
      Log().error('Debe completar todos los campos');
    }
  }

  Future<void> validatePhone() async {
    // ToDo: 'Implementar validacion de telefono';
    state = state.copyWith(isValidate: false);
    await ref.read(routerProvider).pushReplacementNamed(RouterPaths.login);
  }

  void setPhoneNumber(String phone) {
    phoneController.text = phone;
  }

  Future<void> goToTermsPage() async {
    await ref.watch(routerProvider).pushNamed(RouterPaths.termsConditions);
  }

  Future<void> registerUser() async {
    final register = await ref.read(userProvider).register(
          email: emailController.text,
          password: passwordController.text,
        );
    register.fold(
      (l) {
        ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: Text(
              mapError(l.message),
              style: AppStyles.bodyS.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
        Log().error(l.message);
      },
      (r) async {
        final collRef = ref.read(firestoreProvider).collection('Users');
        final docId = collRef.doc();
        final response = await ref.read(databaseProvider).put(
          collection: 'Users',
          document: docId.id,
          data: {
            'doc': docId.id,
            'body': {
              "id": docId.id,
              "firstName": firstNameController.text,
              "lastName": lastNameController.text,
              "fullName":
                  '${firstNameController.text} ${lastNameController.text}',
              "userImg":
                  "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
              "email": emailController.text,
              "birthDate": date,
            },
          },
        );
        Log().info(response);
        response.fold(
          (left) => ScaffoldMessenger.of(rootNavigatorKey.currentContext!)
              .showSnackBar(
            SnackBar(
              content: Text(
                mapError(left.message),
                style: AppStyles.bodyS.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          (right) {
            cleanControllers();
            ref.read(routerProvider).go(RouterPaths.verification);
          },
        );
      },
    );
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true);
    final response = await ref.read(userProvider).login(
          email: emailController.text,
          password: passwordController.text,
        );
    state = state.copyWith(isLoading: false);
    response.fold(
      (left) {
        ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: Text(
              mapError(left.message),
              style: AppStyles.bodyS.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
        Log().error(left.message);
      },
      (right) {
        ref.read(routerProvider).go(RouterPaths.home);
      },
    );
  }

  String mapError(String error) {
    switch (error) {
      case 'user-not-found':
        return 'Usuario no encontrado';
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'too-many-requests':
        return 'Demasiados intentos, intente mas tarde';
      case 'email-already-in-use':
        return 'El email ya esta en uso';
      case 'The supplied auth credential is malformed or has expired':
        return 'Credenciales incorrectas';
      case 'The email address is already in use by another account.':
        return 'El email ya esta en uso';
      default:
        return 'Error desconocido';
    }
  }

  Future<void> logOut() async {
    await ref.read(userProvider).logOut();
    ref.read(routerProvider).go(RouterPaths.login);
  }

  Future<String> signInWithGoogle() async {
    final response = await ref.read(userProvider).signInWithGoogle();
    response.fold(
      (left) => left.message,
      (right) async {
        final check = await checkUserExist(right.user!.email!);
        if (!check) {
          final collRef = ref.read(firestoreProvider).collection('Users');
          final docId = collRef.doc();
          final response = await ref.read(databaseProvider).put(
            collection: 'Users',
            document: docId.id,
            data: {
              'doc': right.user!.email!,
              'body': {
                'firstName': right.user!.displayName!.split(' ')[0],
                'lastName': right.user!.displayName!.split(' ')[1],
                'userEmail': right.user!.email!,
                'birthDate': right.user!.metadata.creationTime,
                'userImage':
                    'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                'felicitups': [{}],
              },
            },
          );
          response.fold(
            (left) => null,
            (right) => ref.read(routerProvider).go(RouterPaths.home),
          );
        } else {
          ref.read(routerProvider).go(RouterPaths.home);
        }
      },
    );
    return '';
  }

  Future<bool> checkUserExist(String email) async {
    final response = await ref.read(databaseProvider).get(
          collection: 'Users',
          document: '',
        );

    return response.fold(
      (left) {
        Log().error(left.message);
        return false;
      },
      (right) {
        if (right['data'] != null) {
          return true;
        } else {
          return false;
        }
      },
    );
  }

  void cleanControllers() {
    emailController.clear();
    passwordController.clear();
    repeatPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }
}
