import 'package:flutter/material.dart';

import 'general/views/pages/landing.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DHRA",
      home: LandingPage(),
    );
  }
}
