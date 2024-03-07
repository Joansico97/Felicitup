import 'package:felicitup/core/extensions/extensions.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1280) {
            return webBody(context, ref) ?? const _BaseWidget();
          } else if (constraints.maxWidth >= 650) {
            return tabletBody(context, ref) ?? const _BaseWidget();
          } else {
            return mobileBody(context, ref) ?? const _BaseWidget();
          }
        },
      );

  Widget? mobileBody(BuildContext context, WidgetRef ref) => null;
  Widget? tabletBody(BuildContext context, WidgetRef ref) => null;
  Widget? webBody(BuildContext context, WidgetRef ref) => null;
}

class _BaseWidget extends StatelessWidget {
  const _BaseWidget();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: size.fullHeight(context),
            width: size.fullWidth(context),
            child: Center(
              child: Text(context.locale.commingSoon),
            ),
          ),
        ),
      );
}
