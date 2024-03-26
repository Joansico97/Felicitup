import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationViewMobile extends StatelessWidget {
  const VerificationViewMobile({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
