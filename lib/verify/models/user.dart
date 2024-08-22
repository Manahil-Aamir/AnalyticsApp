class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final int mobileno;
  final String? avatarUrl;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.mobileno,
    required this.email,
    this.avatarUrl,
  });
}
