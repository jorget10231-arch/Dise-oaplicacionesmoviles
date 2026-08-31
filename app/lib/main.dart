import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';

void main() {
  runApp(const SafeInspectApp());
}

class SafeInspectApp extends StatelessWidget {
  const SafeInspectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeInspect Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
