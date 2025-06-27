class AuthFailure implements Exception {
  final String message;

  AuthFailure({required this.message});

  @override
  String toString() => message;
}
