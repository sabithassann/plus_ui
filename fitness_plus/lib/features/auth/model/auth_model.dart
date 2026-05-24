class AuthResponse {
  final String token;
  final List<String> roles;
  final String username;

  AuthResponse({
    required this.token,
    required this.roles,
    required this.username,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['jwtToken'],
      roles: List<String>.from(json['roles']),
      username: json['username'],
    );
  }
}