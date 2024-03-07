import 'package:felicitup/presentation/features/home/views/views.dart';
import 'package:flutter/material.dart';
import 'package:felicitup/core/utils/base_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  Widget? mobileBody(BuildContext context, WidgetRef ref) => HomeViewMobile(ref: ref);
}
