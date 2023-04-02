import 'package:flutter/material.dart';

import 'general/views/pages/landing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Utano',
      home: LandingPage(),
    );
  }
}
