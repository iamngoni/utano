import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'core/services/assets_cache.dart';
import 'general/views/pages/landing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    cacheAssets(context);
    return MacosApp(
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
      title: 'Utano',
      home: const LandingPage(),
    );
  }
}
