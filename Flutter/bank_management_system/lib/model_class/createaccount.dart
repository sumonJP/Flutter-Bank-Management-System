class Createaccount {
  double? a_number;
  String? password;
  double? nid;
  String? acctype;
  String? name;
  String? gender;
  String? mobile;
  String? email;
  String? address;
  String? date;
  String? mar_status;
  String? occupation;
  double? balance;
  String? img;
  String? msg = null;

  Createaccount(
      {required this.a_number,
      required this.password,
      required this.nid,
      required this.acctype,
      required this.name,
      required this.gender,
      required this.mobile,
      required this.email,
      required this.address,
      required this.date,
      required this.mar_status,
      required this.occupation,
      required this.balance,
        required this.img
      });
  factory Createaccount.fromJson(Map<String, dynamic> json) => Createaccount(
        a_number: json['a_number'],
        password: json['password'],
        nid: json['nid'],
        acctype: json['acctype'],
        name: json['name'],
        gender: json['gender'],
        mobile: json['mobile'],
        email: json['email'],
        address: json['address'],
        date: json['date'],
        mar_status: json['mar_status'],
        occupation: json['occupation'],
        balance: json['balance'],
        img: json['img'],
      );

  Map<String, dynamic> toJson() {
    return {
      "a_number": a_number,
      "password": password,
      "nid": nid,
      "acctype": acctype,
      "name": name,
      "gender": gender,
      "mobile": mobile,
      "email": email,
      "address": address,
      "date": date,
      "mar_status": mar_status,
      "occupation": occupation,
      "balance": balance,
      "img": img
    };
  }
}
