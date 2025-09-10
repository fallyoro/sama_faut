class Laundry {
  final String id;
  final String name;
  final String adress;
  final String phoneNumber;
  final String email;

  Laundry({
    required this.id,
    required this.name,
    required this.adress,
    required this.phoneNumber,
    required this.email,
  });

  factory Laundry.fromJson(Map<String, dynamic> json) {
    return Laundry(
      id: json['id'] as String,
      name: json['name'] as String,
      adress: json['adress'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adress': adress,
      'phone_number': phoneNumber,
      'email': email,
    };
  }
}
