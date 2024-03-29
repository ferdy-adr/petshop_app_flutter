part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  bool _isEmail = false;
  bool _isPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: offWhite,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(24, 46, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello,',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: blackWhite100,
                            ),
                          ),
                          const Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: blackWhite100,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 32),
                            child: const Text(
                              'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14,
                                color: blackWhite50,
                              ),
                            ),
                          ),
                          Form(
                            key: _formSignInKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  onChanged: (value) {
                                    setState(() {
                                      value.trim().isNotEmpty
                                          ? _isEmail = true
                                          : _isEmail = false;
                                    });
                                  },
                                  validator: (String? value) {
                                    return EmailValidator.validate(
                                            (value ?? '').trim())
                                        ? null
                                        : 'Please enter a valid email address.';
                                  },
                                  cursorColor: mainColor100,
                                  style: const TextStyle(
                                    color: mainColor100,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                      color: blackWhite30,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: blackWhite10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: mainColor100,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: redAlert,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: redAlert,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: passwordController,
                                  onChanged: (value) {
                                    setState(() {
                                      value.trim().isNotEmpty
                                          ? _isPassword = true
                                          : _isPassword = false;
                                    });
                                  },
                                  validator: (String? value) {
                                    return (value ?? '').trim().isEmpty
                                        ? 'Required Fields.'
                                        : ((value ?? '').trim().length < 6)
                                            ? 'Passwords must have at least 6 character.'
                                            : null;
                                  },
                                  obscureText: true,
                                  obscuringCharacter: '*',
                                  cursorColor: mainColor100,
                                  style: const TextStyle(
                                    color: mainColor100,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                      color: blackWhite30,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: blackWhite10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: mainColor100,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: redAlert,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: redAlert,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Color.fromRGBO(227, 232, 241, 1.0),
                                    indent: 12,
                                    endIndent: 34,
                                    thickness: 1,
                                  ),
                                ),
                                Text(
                                  'or',
                                  style: TextStyle(
                                    color: Color.fromRGBO(198, 206, 221, 1.0),
                                    fontSize: 12,
                                    fontFamily: 'Hind Siligur',
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Color.fromRGBO(227, 232, 241, 1.0),
                                    indent: 34,
                                    endIndent: 12,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Colors.transparent),
                                      elevation: const MaterialStatePropertyAll<
                                          double>(0),
                                      shape: MaterialStatePropertyAll<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          side: const BorderSide(
                                            color: blackWhite10,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            height: 25,
                                            'assets/images/google-logo.png',
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Google',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  51, 126, 254, 1.0),
                                              fontSize: 14.81,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Colors.transparent),
                                      elevation: const MaterialStatePropertyAll<
                                          double>(0),
                                      shape: MaterialStatePropertyAll<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          side: const BorderSide(
                                            color: blackWhite10,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/fb-logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.85),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: blackWhite90,
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed('sign_up_page');
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: mainColor100,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.92),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            height: 60,
                            child: ElevatedButton(
                              onPressed: (_isEmail == true &&
                                      _isPassword == true)
                                  ? () async {
                                      if (_formSignInKey.currentState!
                                          .validate()) {
                                        SignInSignUpResult result =
                                            await AuthServices.signIn(
                                                emailController.text.trim(),
                                                passwordController.text.trim());

                                        if (result.user != null) {
                                          if (context.mounted) {
                                            context.goNamed('main_page');
                                          }
                                        } else {
                                          // note: Error message when failed login to Firebase.
                                          print(result.message);
                                        }
                                      }
                                    }
                                  : null,
                              style: ButtonStyle(
                                elevation:
                                    const MaterialStatePropertyAll<double>(0),
                                shape: MaterialStatePropertyAll<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.5),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        (_isEmail == true &&
                                                _isPassword == true)
                                            ? mainColor100
                                            : blackWhite10),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: offWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
