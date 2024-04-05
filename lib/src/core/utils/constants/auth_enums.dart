enum AuthStatus { unknown, authenticated }

enum AuthError {
  hostUnreachable,
  unknown,
  wrongEmail,
  wrongPassword,
}

enum AuthType { signUp, signIn }
