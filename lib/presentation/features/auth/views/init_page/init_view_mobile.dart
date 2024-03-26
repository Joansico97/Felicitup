import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitViewMobile extends StatelessWidget {
  const InitViewMobile({super.key, required this.ref});

  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(authProvider.notifier);
    return Scaffold(
      body: SizedBox(
        height: size.fullHeight(context),
        width: size.fullWidth(context),
        child: Column(
          children: [
            Container(
              height: size.height(context, .88),
              width: size.fullWidth(context),
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    Assets.images.logo.path,
                    fit: BoxFit.contain,
                    height: size.height(context, .09),
                  ),
                  SizedBox(height: size.height(context, .03)),
                  Image.asset(
                    Assets.images.logoLetter.path,
                    fit: BoxFit.contain,
                    height: size.height(context, .09),
                  ),
                  SizedBox(height: size.height(context, .02)),
                  Text(
                    'La app para amigos de verdad',
                    style: AppStyles.bodyS,
                  ),
                  SizedBox(height: size.height(context, .05)),
                  SizedBox(
                    width: size.width(context, .45),
                    child: AppRegularButton(
                      onTap: () => notifier.goToRegister(),
                      label: 'Crear cuenta',
                      isActive: true,
                      isLoading: false,
                    ),
                  ),
                  SizedBox(height: size.height(context, .23)),
                  // const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: size.height(context, .12),
              width: size.fullWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes una cuenta?',
                    style: AppStyles.bodyS,
                  ),
                  TextButton(
                    onPressed: () => notifier.goToLogin(),
                    child: Text(
                      'Inicia sesión',
                      style: AppStyles.linksL,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
