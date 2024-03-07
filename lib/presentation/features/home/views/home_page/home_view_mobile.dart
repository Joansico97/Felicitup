import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/infraestructure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    super.key,
    required this.ref,
  });
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                ref.read(userProvider).logOut();
                ref.read(routerProvider).go(RouterPaths.login);
              },
              child: Container(
                height: size.height(context, .1),
                width: size.fullWidth(context),
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
