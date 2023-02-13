import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../home/home_page.dart';

part 'router.g.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const HomePageRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      return null;
    },
  );
});

@TypedGoRoute<HomePageRoute>(
  path: '/',
)

/// ホーム画面
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
