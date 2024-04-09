import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class VerificationViewMobile extends StatelessWidget {
  const VerificationViewMobile({
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
          padding: size.symmetric(context, .08, .08),
          child: state.isValidate
              ? CodeView(notifier: notifier)
              : PhoneView(notifier: notifier),
        ),
      ),
    );
  }
}

class PhoneView extends StatelessWidget {
  const PhoneView({
    super.key,
    required this.notifier,
  });

  final AuthFeatureEvents notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.icons.logo),
        SizedBox(height: size.height(context, .03)),
        Image.asset(
          Assets.images.logoLetter.path,
        ),
        SizedBox(height: size.height(context, .03)),
        Text(
          'Código de verification',
          style: AppStyles.paragraphHeaderL,
        ),
        SizedBox(height: size.height(context, .02)),
        Text(
          'A continuación introduce tu número de teléfono y te enviaremos un sms con un código de verificación.',
          textAlign: TextAlign.center,
          style: AppStyles.bodyS,
        ),
        SizedBox(height: size.height(context, .03)),
        SizedBox(
          width: size.width(context, .6),
          child: IntlPhoneField(
            languageCode: 'es',
            decoration: InputDecoration(
              labelText: '000 00 00 00',
              labelStyle: AppStyles.bodyS,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            initialCountryCode: 'ES',
            onChanged: (value) {
              notifier.setPhoneNumber(value.completeNumber);
            },
          ),
        ),
        const Spacer(),
        SizedBox(
          width: size.width(context, .4),
          child: AppSmallButton(
            onTap: () => notifier.changeView(),
            label: 'Continuar',
            isActive: true,
          ),
        ),
      ],
    );
  }
}

class CodeView extends StatelessWidget {
  const CodeView({
    super.key,
    required this.notifier,
  });

  final AuthFeatureEvents notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.icons.logo),
        SizedBox(height: size.height(context, .03)),
        Image.asset(
          Assets.images.logoLetter.path,
        ),
        SizedBox(height: size.height(context, .03)),
        Text(
          'Código de verification',
          style: AppStyles.paragraphHeaderL,
        ),
        SizedBox(height: size.height(context, .02)),
        Text(
          'Ya casi hemos terminado. A continuación introduce el código que hemos enviado a tu móvil.',
          textAlign: TextAlign.center,
          style: AppStyles.bodyS,
        ),
        SizedBox(height: size.height(context, .03)),
        SizedBox(
          width: size.width(context, .8),
          child: TextFormField(),
        ),
        const Spacer(),
        SizedBox(
          width: size.width(context, .4),
          child: AppSmallButton(
            onTap: () => notifier.validatePhone(),
            label: 'Continuar',
            isActive: true,
          ),
        ),
      ],
    );
  }
}
