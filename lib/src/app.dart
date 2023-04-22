import 'package:app/src/infra/views/home/home_page.dart';
import 'package:app/src/infra/views/login/login.dart';
import 'package:flutter/material.dart';
import 'utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açai',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/' :(context) => const HomeApp(),
        '/login' :(context) => const LoginApp(),
      },
    );
  }
}