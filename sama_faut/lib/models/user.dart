class User {
  final String id;
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;
  final DateTime createAt;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.createAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      createAt: json['create_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'create_at': createAt,
    };
  }
}
