class Loanapproval {

  int? accnumber;
  String? password;
  int? nid;
  String? loantype;
  double? req_amount;
  String? duration;
  double? cash;
  String? interest_rate;
  double? total_amount;
  int? installment;
  int? paid_installment;
  double? monthlypaid;
  double? paid_amount;
  double? due;
  String? name;
  String? gender;
  String? mobile;
  String? email;
  String? address;
  String? date;
  String? mar_status;
  String? occupation;
  String? msg = null;

  Loanapproval(
      {required this.accnumber,
        required this.password,
        required this.nid,
        required this.loantype,
        required this.req_amount,
        required this.duration,
        required this.cash,
        required this.interest_rate,
        required this.total_amount,
        required this.installment,
        required this.paid_installment,
        required this.monthlypaid,
        required this.paid_amount,
        required this.due,
        required this.name,
        required this.gender,
        required this.mobile,
        required this.email,
        required this.address,
        required this.date,
        required this.mar_status,
        required this.occupation,
      });
  factory Loanapproval.fromJson(Map<String, dynamic> json) => Loanapproval(
    accnumber: json['accnumber'],
    password: json['password'],
    nid: json['nid'],
    loantype: json['loantype'],
    req_amount: json['req_amount'],
    duration: json['duration'],
    cash: json['cash'],
    interest_rate: json['interest_rate'],
    total_amount: json['total_amount'],
    installment: json['installment'],
    paid_installment: json['paid_installment'],
    monthlypaid: json['monthlypaid'],
    paid_amount: json['paid_amount'],
    due: json['due'],
    name: json['name'],
    gender: json['gender'],
    mobile: json['mobile'],
    email: json['email'],
    address: json['address'],
    date: json['date'],
    mar_status: json['mar_status'],
    occupation: json['occupation'],
  );

  Map<String, dynamic> toJson() {
    return {
      "accnumber": accnumber,
      "password": password,
      "nid": nid,
      "loantype": loantype,
      "req_amount": req_amount,
      "duration": duration,
      "cash": cash,
      "interest_rate": interest_rate,
      "total_amount": total_amount,
      "installment": installment,
      "paid_installment": paid_installment,
      "monthlypaid": monthlypaid,
      "paid_amount": paid_amount,
      "due": due,
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
