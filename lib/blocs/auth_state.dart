abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String uid;
  final String? name;
  final String? email;

  AuthAuthenticated({
    required this.uid, 
    this.name, 
    this.email,
  });
}

class AuthUnauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
