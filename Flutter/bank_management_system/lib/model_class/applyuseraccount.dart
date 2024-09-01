class Applyuseraccount {
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

  Applyuseraccount({
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
  });
  factory Applyuseraccount.fromJson(Map<String, dynamic> json) =>
      Applyuseraccount(
          nid: json['nid'],
          acctype: json['acctype'],
          name: json['name'],
          gender: json['gender'],
          mobile: json['mobile'],
          email: json['email'],
          address: json['address'],
          date: json['date'],
          mar_status: json['mar_status'],
          occupation: json['occupation']);
  Map<String, dynamic> toJson() {
    return {
      "nid": nid,
      "acctype": acctype,
      "name": name,
      "gender": gender,
      "mobile": mobile,
      "email": email,
      "address": address,
      "date": date,
      "mar_status": mar_status,
      "occupation": occupation
    };
  }
}