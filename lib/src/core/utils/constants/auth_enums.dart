enum AuthType { signUp, signIn }

extension AuthTypeX on AuthType {
  bool get isSignUp => this == AuthType.signUp;

  bool get isSignIn => this == AuthType.signIn;
}
