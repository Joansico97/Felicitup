import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class RegisterViewMobile extends StatelessWidget {
  const RegisterViewMobile({
    super.key,
    required this.ref,
  });
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    final notifier = ref.watch(authProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.fullHeight(context),
          width: size.fullWidth(context),
          padding: size.symmetric(context, .08, .05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(Assets.icons.logo),
                SizedBox(height: size.height(context, .05)),
                Image.asset(
                  Assets.images.logoLetter.path,
                ),
                SizedBox(height: size.height(context, .05)),
                Form(
                  child: Column(
                    children: [
                      AppRegisterInputField(
                        isEmail: true,
                        hintText: 'Email',
                        controller: notifier.emailController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppRegisterInputField(
                        isEmail: false,
                        hintText: 'Contraseña',
                        controller: notifier.passwordController,
                        isObscure: state.isObscure,
                        onTap: () => notifier.changeObscure(),
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppRegisterInputField(
                        isEmail: false,
                        hintText: 'Repetir Contraseña',
                        controller: notifier.repeatPasswordController,
                        isObscure: state.isRepObscure,
                        onTap: () => notifier.changeRepObscure(),
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppRegisterInputField(
                        isEmail: true,
                        hintText: 'Nombre',
                        controller: notifier.firstNameController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppRegisterInputField(
                        isEmail: true,
                        hintText: 'Apellidos',
                        controller: notifier.lastNameController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      GestureDetector(
                        onTap: () => notifier.showSchedule(),
                        child: Container(
                          height: size.height(context, .07),
                          padding: size.horizontal(context, .03),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: state.birthDate == '' ? 1 : 2,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.birthDate == ''
                                    ? 'Fecha Nacimiento'
                                    : state.birthDate,
                                style: AppStyles.bodyS.copyWith(
                                  color: state.birthDate == ''
                                      ? AppColors.darkGrey
                                      : AppColors.text,
                                ),
                              ),
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: AppColors.orange,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height(context, .02)),
                      SizedBox(
                        width: size.width(context, .4),
                        child: AppSmallButton(
                          onTap: () => notifier.registerProccess(),
                          label: 'Continuar',
                          isActive: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height(context, .01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya estás registrado?',
                      style: AppStyles.bodyS.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => notifier.goToLogin(),
                      child: Text(
                        ' Acceder',
                        style: AppStyles.bodyS.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height(context, .03)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
