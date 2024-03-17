import 'dart:io';

import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({
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
                SizedBox(height: size.height(context, .2)),
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
                      AppRegularButton(
                        onTap: () async {
                          final response = await notifier.login();
                          if (response != '') {
                            context.mounted
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(response),
                                    ),
                                  )
                                : null;
                          }
                        },
                        label: 'Entrar',
                        isActive: true,
                        isLoading: state.isLoading,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height(context, .03)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aun no tienes cuenta? ',
                      style: AppStyles.bodyS,
                    ),
                    GestureDetector(
                      onTap: () => ref
                          .read(routerProvider)
                          .pushNamed(RouterPaths.register),
                      child: Text(
                        'Registrate',
                        style: AppStyles.bodyS.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height(context, .05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      width: size.width(context, .3),
                      color: const Color(0xFFE5E5E5),
                    ),
                    Text(
                      'O',
                      style: AppStyles.bodyL.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: size.width(context, .3),
                      color: const Color(0xFFE5E5E5),
                    ),
                  ],
                ),
                SizedBox(height: size.height(context, .05)),
                AppRegularButton(
                  onTap: () async => await notifier.signInWithGoogle(),
                  label: 'Entrar con Google',
                  isActive: true,
                  icon: PhosphorIconsRegular.googleLogo,
                  isLoading: false,
                ),
                SizedBox(height: size.height(context, .02)),
                Visibility(
                  visible: Platform.isIOS,
                  child: AppRegularButton(
                    onTap: () => Log().debug('Apple'),
                    label: 'Entrar con Apple',
                    isActive: true,
                    icon: PhosphorIconsRegular.appleLogo,
                    isLoading: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
