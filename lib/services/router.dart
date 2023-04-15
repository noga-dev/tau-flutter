import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tau/views/screens/mood_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) => _goRouter;

final _goRouter = GoRouter(
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MoodLogScreen();
}
