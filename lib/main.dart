import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tau/services/router.dart';
import 'package:url_protocol/url_protocol.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  registerProtocolHandler(
    'https://taumh.dev/auth-callback',
    arguments: ['-url', '%s'],
  );

  Supabase.initialize(
    url: 'https://vobmagvouahifxtwklqo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZvYm1hZ3ZvdWFoaWZ4dHdrbHFvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODE1ODEyNDIsImV4cCI6MTk5NzE1NzI0Mn0.y3-Or79Zl9Rf-crMMlub6JTQwHX_U5fikNsxDmCaQRQ',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Tau',
      theme: ThemeData.dark(),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
