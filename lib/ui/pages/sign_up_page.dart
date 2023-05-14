part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();
  bool _isName = false;
  bool _isEmail = false;
  bool _isPassword = false;

  /// this variable for value TOS and Privacy Police checkbox.
  bool _isChecked = false;

  bool isValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    isValid = (_isName && _isEmail && _isPassword && _isChecked);

    return WillPopScope(
      onWillPop: () async {
        context.goNamed('sign_in_page');
        return false;
      },
      child: Scaffold(
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
                            Text(
                              'Create New\nAccount',
                              style: blackTextFont.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 32),
                              child: Text(
                                'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                                textAlign: TextAlign.justify,
                                style: greyTextFont.copyWith(height: 1.5),
                              ),
                            ),
                            Form(
                              key: _formSignUpKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    onChanged: (value) {
                                      setState(() {
                                        value.trim().isNotEmpty
                                            ? _isName = true
                                            : _isName = false;
                                      });
                                    },
                                    cursorColor: mainColor100,
                                    style: const TextStyle(
                                      color: mainColor100,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Full Name',
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
                            const SizedBox(height: 23),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 2, right: 10),
                                  width: 14,
                                  height: 14,
                                  child: Checkbox(
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != null) _isChecked = value;
                                      });
                                    },
                                    activeColor: mainColor100,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    fillColor: MaterialStatePropertyAll(
                                        (_isChecked)
                                            ? mainColor100
                                            : blackWhite10),
                                  ),
                                ),
                                Flexible(
                                  flex: 10,
                                  child: RichText(
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    text: TextSpan(
                                      text: 'I Agree to the ',
                                      style: greyTextFont.copyWith(
                                        color: blackWhite30,
                                        fontSize: 12,
                                        height: 1.6,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Terms of Service',
                                          style: amberTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // note: This line for onTap action when tap TOS text.
                                            },
                                        ),
                                        TextSpan(
                                          text: ' and ',
                                          style: greyTextFont.copyWith(
                                            color: blackWhite30,
                                            fontSize: 12,
                                            height: 1.6,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: amberTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.6,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // note: This line for onTap action when tap Privacy Policy text.
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  flex: 3,
                                  child: SizedBox(),
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
                            Text(
                              'Have an account?',
                              style: greyTextFont.copyWith(
                                color: blackWhite90,
                                fontSize: 12,
                                height: 1.6,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.goNamed('sign_in_page'),
                              child: Text(
                                ' Login',
                                style: amberTextFont.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              height: 60,
                              child: ElevatedButton(
                                onPressed: (isValid)
                                    ? () async {
                                        if (_formSignUpKey.currentState!
                                            .validate()) {
                                          SignInSignUpResult result =
                                              await AuthServices.signUp(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                            name: nameController.text.trim(),
                                          );

                                          if (result.user != null) {
                                            if (context.mounted) {
                                              context.goNamed('main_page');
                                            }
                                          } else {
                                            // note: Error message when failed sign up to Firebase.
                                            print(result.message);
                                          }
                                        }
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.5)),
                                  backgroundColor:
                                      (isValid) ? mainColor100 : blackWhite10,
                                ),
                                child: Text(
                                  'Get Started',
                                  style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.8,
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
      ),
    );
  }
}
