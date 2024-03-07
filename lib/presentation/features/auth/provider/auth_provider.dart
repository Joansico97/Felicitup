import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/colors.dart';
import 'package:felicitup/core/utils/logger.dart';
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
    required String birthDate,
  }) = _AuthFeatureModel;

  factory AuthFeatureModel.fromJson(Map<String, dynamic> json) => _$AuthFeatureModelFromJson(json);
}

class AuthFeatureEvents extends StateNotifier<AuthFeatureModel> {
  AuthFeatureEvents(this.ref)
      : super(
          const AuthFeatureModel(
            isObscure: true,
            isRepObscure: true,
            birthDate: '',
          ),
        );

  final Ref ref;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  DateTime date = DateTime.now();

  void changeObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void changeRepObscure() {
    state = state.copyWith(isRepObscure: !state.isRepObscure);
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
                colorScheme: const ColorScheme.light(primary: AppColors.primary),
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
      await registerUser();
    } else {
      Log().error('Debe completar todos los campos');
    }
  }

  Future<void> registerUser() async {
    await ref.read(userProvider).register(email: emailController.text, password: passwordController.text);
    final response = await ref.read(databaseProvider).put(
      path: 'Users',
      queryparameters: {
        'doc': emailController.text,
        'body': {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'birthDate': state.birthDate,
          'userImage': 'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745'
        },
      },
    );
    Log().error(response);
    if (response.isRight) {
      ref.read(routerProvider).go(RouterPaths.home);
    }
  }
}
