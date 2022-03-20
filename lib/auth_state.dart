abstract class AuthState {}

class UnknownAuthState extends AuthState {}

class Authenticated extends AuthState {
  final String userId;

  Authenticated({required this.userId});
}

class Unauthenticated extends AuthState {}
