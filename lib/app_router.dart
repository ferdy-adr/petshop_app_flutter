part of 'main.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
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
      GoRoute(
        path: '/main_page',
        name: 'main_page',
        builder: (context, state) {
          return const MainPage();
        },
      ),
    ],
    initialLocation: '/main_page',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
