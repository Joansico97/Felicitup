import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/auth/provider/auth_provider.dart';
import 'package:felicitup/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsConditionsViewMobile extends StatelessWidget {
  const TermsConditionsViewMobile({
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
                SizedBox(height: size.height(context, .03)),
                Image.asset(
                  Assets.images.logoLetter.path,
                ),
                SizedBox(height: size.height(context, .03)),
                Container(
                  padding: size.all(context, .04),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'TÉRMINOS Y CONDICIONES',
                        style: AppStyles.paragraphHeaderL,
                      ),
                      SizedBox(height: size.height(context, .05)),
                      Text(
                        '''Dolor eu in ea aliquip dolore sunt cupidatat. Aliquip do commodo labore nostrud. Eiusmod in voluptate aliquip mollit amet labore ut laborum.
                    
                    Lorem id ut excepteur reprehenderit do esse non enim. Eiusmod nisi labore incididunt ex. Aliquip dolore laborum culpa velit esse minim non labore. Magna amet laborum laboris deserunt voluptate sint cillum amet ea veniam dolore dolore id nostrud. Laboris consequat duis deserunt cupidatat exercitation cillum do aliqua sunt culpa incididunt cillum excepteur eiusmod. Aliqua sunt amet non id minim ad enim deserunt labore ad mollit voluptate ad non. Occaecat aliqua ea aliquip qui.
                      ''',
                        style: AppStyles.bodyS,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      Text(
                        'Haga clic en "Aceptar y continuar" para aceptar los Términos y condiciones de FELICITUP',
                        style: AppStyles.bodyS,
                      ),
                      SizedBox(height: size.height(context, .02)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ACEPTAR CONDICIONES',
                            style: AppStyles.bodyS,
                          ),
                          Checkbox(
                            value: state.checkTerms,
                            onChanged: (value) => notifier.checkTerms(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height(context, .02)),
                SizedBox(
                  width: size.width(context, .4),
                  child: AppSmallButton(
                    onTap: () => notifier.registerUser(),
                    label: 'Continuar',
                    isActive: state.checkTerms,
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
