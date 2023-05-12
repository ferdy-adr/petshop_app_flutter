import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshop_app_flutter/shared/shared.dart';
import 'package:petshop_app_flutter/ui/pages/pages.dart';
import 'package:petshop_app_flutter/services/services.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

part 'app_router.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream(),
      initialData: null,
      builder: (context, child) {
        User? firebaseUser = Provider.of<User?>(context);

        if (firebaseUser == null) {
          if (previousPage != 'onboarding_page') {
            if (previousPage == 'main_page') {
              previousPage = 'onboarding_page';
              AppRouter.router.goNamed('sign_in_page');
            } else {
              previousPage = 'onboarding_page';
              AppRouter.router.goNamed('onboarding_page');
            }
          }
        } else {
          if (previousPage != 'main_page') {
            previousPage = 'main_page';
            AppRouter.router.goNamed('main_page');
          }
        }

        return child ?? Container();
      },
      child: MaterialApp.router(
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
