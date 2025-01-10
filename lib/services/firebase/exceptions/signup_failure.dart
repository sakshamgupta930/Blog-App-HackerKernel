class SignupFailure {
  final String message;

  const SignupFailure({this.message = "An unknown error occured"});

  factory SignupFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupFailure(message: 'Password is too weak');
      case 'invalid-email':
        return const SignupFailure(
            message: 'Email is invalid or badly formatted');
      case 'operation-not-allowed':
        return const SignupFailure(
            message:
                'operation-not-allowed: Email/password accounts are not enabled.');
      case 'user-disabled':
        return const SignupFailure(message: 'This use has been disabled.');
      case 'email-already-in-use':
        return const SignupFailure(message: 'Email is already in use');
      default:
        return const SignupFailure();
    }
  }
}
