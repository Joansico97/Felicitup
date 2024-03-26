import 'package:felicitup/presentation/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'router_paths.dart';
part 'router_handler.dart';

final routerProvider = Provider<GoRouter>((ref) => _appRouter);

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final _appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RouterPaths.init,
  routes: [
    GoRoute(
      path: RouterPaths.init,
      name: RouterPaths.init,
      parentNavigatorKey: rootNavigatorKey,
      builder: _initHandler,
    ),
    GoRoute(
      path: RouterPaths.home,
      name: RouterPaths.home,
      parentNavigatorKey: rootNavigatorKey,
      builder: _homeHandler,
    ),
    GoRoute(
      path: RouterPaths.login,
      name: RouterPaths.login,
      parentNavigatorKey: rootNavigatorKey,
      builder: _loginHandler,
    ),
    GoRoute(
      path: RouterPaths.register,
      name: RouterPaths.register,
      parentNavigatorKey: rootNavigatorKey,
      builder: _registerHandler,
    ),
    GoRoute(
      path: RouterPaths.termsConditions,
      name: RouterPaths.termsConditions,
      parentNavigatorKey: rootNavigatorKey,
      builder: _termsConditionsHandler,
    ),
    GoRoute(
      path: RouterPaths.verification,
      name: RouterPaths.verification,
      parentNavigatorKey: rootNavigatorKey,
      builder: _verificationHandler,
    ),
  ],
);
