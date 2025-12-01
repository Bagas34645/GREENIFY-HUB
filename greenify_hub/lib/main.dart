import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';


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
    );
  }
}
