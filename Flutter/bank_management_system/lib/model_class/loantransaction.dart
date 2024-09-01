class Loantransaction {

  int? tid;
  String? ttype;
  int? accnumber;
  String? loantype;
  int? totalinstallment;
  int? payinstallment;
  double? paidamount;
  double? dueamount;
  String? date;


  Loantransaction({
    required this.tid,
    required this.ttype,
    required this.accnumber,
    required this.loantype,
    required this.totalinstallment,
    required this.payinstallment,
    required this.paidamount,
    required this.dueamount,
    required this.date
  });

  factory Loantransaction.fromJson(Map<String, dynamic> json) =>
      Loantransaction(
          tid: json['tid'],
          ttype: json['ttype'],
          accnumber: json['accnumber'],
          loantype: json['loantype'],
          totalinstallment: json['totalinstallment'],
          payinstallment: json['payinstallment'],
          paidamount: json['paidamount'],
          dueamount: json['dueamount'],
          date: json['date']
      );

  Map<String, dynamic> toJson() {
    return {
      "tid": tid,
      "ttype": ttype,
      "accnumber": accnumber,
      "loantype": loantype,
      "totalinstallment": totalinstallment,
      "payinstallment": payinstallment,
      "paidamount":paidamount,
      "dueamount": dueamount,
      "date": date,
    };
  }
}