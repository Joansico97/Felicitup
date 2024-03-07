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
                SizedBox(height: size.height(context, .1)),
                Text(
                  'INFORMACIÓN USUARIO',
                  style: AppStyles.subTitleSmallBold,
                ),
                SizedBox(height: size.height(context, .05)),
                Form(
                  child: Column(
                    children: [
                      AppInputField(
                        isEmail: true,
                        hintText: 'Email',
                        controller: notifier.emailController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppInputField(
                        isEmail: false,
                        hintText: 'Contraseña',
                        controller: notifier.passwordController,
                        isObscure: state.isObscure,
                        onTap: () => notifier.changeObscure(),
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppInputField(
                        isEmail: false,
                        hintText: 'Repetir Contraseña',
                        controller: notifier.repeatPasswordController,
                        isObscure: state.isRepObscure,
                        onTap: () => notifier.changeRepObscure(),
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppInputField(
                        isEmail: true,
                        hintText: 'Nombre',
                        controller: notifier.firstNameController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      AppInputField(
                        isEmail: true,
                        hintText: 'Apellidos',
                        controller: notifier.lastNameController,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      GestureDetector(
                        onTap: () => notifier.showSchedule(),
                        child: Container(
                          height: size.height(context, .08),
                          padding: size.horizontal(context, .03),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            border: Border.all(
                              color: AppColors.darkGrey,
                            ),
                            borderRadius: size.borderRadius(context, .02),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.birthDate == '' ? 'Fecha Nacimiento' : state.birthDate,
                                style: AppStyles.bodyL.copyWith(
                                  color: state.birthDate == '' ? AppColors.lightGrey : AppColors.text,
                                ),
                              ),
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: AppColors.primary,
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
                          label: 'Siguiente',
                          isActive: true,
                        ),
                      ),
                    ],
                  ),
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
