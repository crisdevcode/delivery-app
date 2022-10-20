class SignUpRepositoryParameters {
  // Properties
  final String email;
  final String password;

  // Constructor
  SignUpRepositoryParameters({required this.email, required this.password});

  Map<String, dynamic> toMap() => {"email": email, "password": password};
}
