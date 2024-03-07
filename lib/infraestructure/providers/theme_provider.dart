import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = NotifierProvider<_IsDarkModeProvider, bool>(
  () => _IsDarkModeProvider(),
);

class _IsDarkModeProvider extends Notifier<bool> {
  @override
  bool build() {
    const bool defaultDarkTheme = false;
    return defaultDarkTheme;
  }

  changeTheme(bool isDarkMode) async {
    state = isDarkMode;
  }
}
