import 'package:app/src/views/login.dart';
import 'package:flutter/material.dart';
import 'infra/utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açai',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LoginApp(),
    );
  }
}