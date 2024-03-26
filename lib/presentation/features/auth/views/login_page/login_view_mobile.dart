import 'dart:io';

import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                SizedBox(height: size.height(context, .027)),
                Image.asset(
                  Assets.images.logoLetter.path,
                  height: size.height(context, .26),
                ),
                SizedBox(
                  width: size.width(context, .7),
                  child: Form(
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height(context, .02)),
                        SizedBox(
                          width: size.width(context, .45),
                          child: AppRegularButton(
                            onTap: () async => await notifier.login(),
                            label: 'Continuar',
                            isActive: true,
                            isLoading: state.isLoading,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height(context, .05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      width: size.width(context, .3),
                      color: const Color(0xFF1D1D1B),
                    ),
                    Text(
                      'O',
                      style: AppStyles.bodyL,
                    ),
                    Container(
                      height: 2,
                      width: size.width(context, .3),
                      color: const Color(0xFF1D1D1B),
                    ),
                  ],
                ),
                SizedBox(height: size.height(context, .05)),
                SizedBox(
                  width: size.width(context, .6),
                  child: AppSocialRegularButton(
                    onTap: () async => await notifier.signInWithGoogle(),
                    label: 'Entrar con Google',
                    isActive: true,
                    icon: Assets.icons.googleLogo,
                    isLoading: false,
                  ),
                ),
                SizedBox(height: size.height(context, .02)),
                Visibility(
                  visible: Platform.isIOS,
                  child: SizedBox(
                    width: size.width(context, .6),
                    child: AppSocialRegularButton(
                      onTap: () => Log().debug('Apple'),
                      label: 'Entrar con Facebook',
                      isActive: true,
                      icon: Assets.icons.facebookLogo,
                      isLoading: false,
                    ),
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
