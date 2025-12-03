import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/home/home_page.dart'; // sesuaikan path
import 'screens/home/event_page.dart'; // sesuaikan path

void main() {
  runApp(const GreenifyHub());
}

class GreenifyHub extends StatelessWidget {
  const GreenifyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RuangHijau',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      home: const SplashScreen(),

      routes: {
        "/login": (_) => const LoginPage(),
        "/register": (_) => const RegisterPage(),
        "/home": (_) => const HomePage(),
        "/event": (_) => const EventPage(),
      },
    );
  }
}
