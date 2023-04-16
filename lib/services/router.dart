import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tau/utils/consts.dart';
import 'package:tau/views/screens/login_screen.dart';
import 'package:tau/views/screens/mood_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return _goRouter(ref);
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<AuthState> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (AuthState authState) {
        final AuthChangeEvent event = authState.event;
        // final Session? session = authState.session;
        if (event == AuthChangeEvent.signedIn) {
          // handle signIn event
        }

        notifyListeners();
      },
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter _goRouter(AppRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    refreshListenable:
        _GoRouterRefreshStream(Supabase.instance.client.auth.onAuthStateChange),
    navigatorKey: Consts.navKey,
    routes: $appRoutes,
    initialLocation: '/',
    redirect: (context, state) {
      if (Supabase.instance.client.auth.currentUser == null) {
        return '/login';
      }

      return null;
    },
  );
}

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MoodLogScreen();
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}
