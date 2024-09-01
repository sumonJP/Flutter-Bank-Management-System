class Admin {
  int? id;
  String? password;
  String? name;
  String? gender;
  String? email;
  String? phone;
  String? address;

  Admin(
      {required this.id,
      required this.password,
      required this.name,
      required this.gender,
      required this.email,
      required this.phone,
      required this.address});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
      id: json['id'],
      password: json['password'],
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      address: json['address']
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "password": password,
      "name": name,
      "gender": gender,
      "email": email,
      "phone": phone,
      "address": address,
    };
  }
}
