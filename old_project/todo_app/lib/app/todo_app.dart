import 'package:flutter/material.dart';
import 'package:todo_app/config/routes/routes_provider.dart';
import 'package:todo_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Banner 숨김
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
