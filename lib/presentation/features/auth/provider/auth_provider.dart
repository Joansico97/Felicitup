import 'package:either_dart/either.dart';
import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/colors.dart';
import 'package:felicitup/core/utils/logger.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/infraestructure/providers/auth_provider.dart';
import 'package:felicitup/infraestructure/providers/database_provider.dart';
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

  Future<void> showSchedule() async {
    DateTime? newDate = await showDatePicker(
        context: rootNavigatorKey.currentContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: ((context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme:
                    const ColorScheme.light(primary: AppColors.primary),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ),
              child: child!);
        }));

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
      Log().error('Debe completar todos los campos');
    }
  }

  Future<void> goToTermsPage() async {
    await ref.watch(routerProvider).pushNamed(RouterPaths.termsConditions);
  }

  Future<void> registerUser() async {
    await ref.read(userProvider).register(
          email: emailController.text,
          password: passwordController.text,
        );
    final response = await ref.read(databaseProvider).put(
      path: 'Users',
      queryparameters: {
        'doc': emailController.text,
        'body': {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'userEmail': emailController.text,
          'birthDate': date,
          'userImage':
              'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
          'felicitups': [{}],
        },
      },
    );
    Log().info(response);
    response.fold(
      (left) => null,
      (right) => ref.read(routerProvider).go(RouterPaths.login),
    );
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true);
    final response = await ref
        .read(userProvider)
        .login(email: emailController.text, password: passwordController.text);
    response.fold(
      (left) => Log().error(left.message),
      (right) => ref.read(routerProvider).go(RouterPaths.home),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> logOut() async {
    await ref.read(userProvider).logOut();
    ref.read(routerProvider).go(RouterPaths.login);
  }

  Future<void> signInWithGoogle() async {
    final response = await ref.read(userProvider).signInWithGoogle();
    response.fold(
      (left) => Log().error(left.message),
      (right) async {
        final check = await checkUserExist(right.user!.email!);
        if (!check) {
          final response = await ref.read(databaseProvider).put(
            path: 'Users',
            queryparameters: {
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
  }

  Future<bool> checkUserExist(String email) async {
    final response = await ref.read(databaseProvider).get(
      path: 'Users',
      queryparameters: {
        'doc': email,
      },
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
}
