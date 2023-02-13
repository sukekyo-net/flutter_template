import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:template/presentation/router/router.dart';

import 'presentation/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ref.watch(themeProvider),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      builder: _responsiveBuilder,
    );
  }
}

Widget _responsiveBuilder(context, child) {
  // TODOl 調整
  return ResponsiveWrapper.builder(
    child,
    maxWidth: 1200,
    minWidth: 480,
    defaultScale: true,
    breakpoints: [
      const ResponsiveBreakpoint.resize(480, name: MOBILE),
      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
      const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
    ],
  );
}
