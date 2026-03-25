import 'package:flutter/material.dart';

import '../home/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomePage(), debugShowCheckedModeBanner: false);
  }
}
