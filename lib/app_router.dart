part of 'main.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/welcome',
        name: 'onboarding_page',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'sign_in_page',
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/sign-up',
        name: 'sign_up_page',
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: '/',
        name: 'main_page',
        builder: (context, state) {
          return const MainPage();
        },
      ),
    ],
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
