import 'package:felicitup/app.dart';
import 'package:felicitup/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await initConfig();
  runApp(const ProviderScope(child: Felicitup()));
}
