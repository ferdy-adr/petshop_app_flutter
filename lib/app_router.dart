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
        routes: [
          GoRoute(
            path: 'product/:id',
            name: 'product_detail_page',
            builder: (context, state) {
              Object? object = state.extra;

              return ProductDetail(
                product: (object != null && object is Product)
                    ? object
                    : const Product(
                        productID: 'null',
                        name: 'null',
                        shortName: 'null',
                      ),
              );
            },
          ),
          GoRoute(
            path: 'notification',
            name: 'notification_page',
            builder: (context, state) => const NotificationPage(),
          )
        ],
      ),
    ],
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
