import 'package:flutter/material.dart';
import 'package:petshop_app_flutter/ui/login_screen.dart';
import 'package:petshop_app_flutter/ui/onboarding.dart';
import 'package:petshop_app_flutter/ui/style_guide.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        errorColor: redAlert,
      ),
      home: const LoginScreen(),
    );
  }
}
