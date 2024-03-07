import 'package:felicitup/core/constants/constants.dart';
import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/core/theme/theme.dart';
import 'package:felicitup/gen/l10n.dart';
import 'package:felicitup/infraestructure/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Felicitup extends ConsumerWidget {
  const Felicitup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    return MaterialApp.router(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        IntlTrans.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme(isDarkmode: isDarkMode).getTheme(),
      locale: locale,
      supportedLocales: IntlTrans.delegate.supportedLocales,
      routerConfig: router,
    );
  }
}
