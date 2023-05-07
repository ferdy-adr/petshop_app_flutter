import 'package:flutter/material.dart';
import 'package:petshop_app_flutter/ui/pages/pages.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/onboarding',
          name: 'onboarding_page',
          builder: (context, state) {
            return const OnboardingPage();
          },
        ),
        GoRoute(
          path: '/sign_in',
          name: 'sign_in',
          builder: (context, state) {
            return const SignInPage();
          },
        ),
      ],
      initialLocation: '/onboarding',
      debugLogDiagnostics: true,
      routerNeglect: true,
    );

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
