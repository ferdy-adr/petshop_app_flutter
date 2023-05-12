part of 'services.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserAccount? user = credential.user?.convertToUserAccount(name: email);
      if (user != null) await UserAccountServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message ?? 'Unknown Error');
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserAccount? user = await credential.user?.fromFirestore();

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message ?? 'Unknown Error');
    }
  }

  static Stream<User?> userStream() => _auth.authStateChanges();
}

class SignInSignUpResult {
  final UserAccount? user;
  final String? message;

  const SignInSignUpResult({this.user, this.message});
}
