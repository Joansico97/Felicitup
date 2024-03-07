import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/presentation/features/auth/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends BasePage {
  const RegisterPage({super.key});

  @override
  Widget? mobileBody(BuildContext context, WidgetRef ref) => RegisterViewMobile(ref: ref);
}
