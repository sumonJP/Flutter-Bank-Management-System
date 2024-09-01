class Transaction {
  int? tid;
  String? ttype;
  double? a_number;
  String? a_type;
  double? prebalance;
  double? tamount;
  double? curbalance;
  String? date;
  String? time;
  double? toacc_number;

  Transaction({
    required this.tid,
    required this.ttype,
    required this.a_number,
    required this.a_type,
    required this.prebalance,
    required this.tamount,
    required this.curbalance,
    required this.date,
    required this.time,
    required this.toacc_number,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      Transaction(
          tid: json['tid'],
          ttype: json['ttype'],
          a_number: json['a_number'],
          a_type: json['a_type'],
          prebalance: json['prebalance'],
          tamount: json['tamount'],
          curbalance: json['curbalance'],
          date: json['date'],
          time: json['time'],
          toacc_number: json['toacc_number']);

  Map<String, dynamic> toJson() {
    return {
      "tid": tid,
      "ttype": ttype,
      "a_number": a_number,
      "a_type": a_type,
      "prebalance": prebalance,
      "tamount": tamount,
      "curbalance": curbalance,
      "date": date,
      "time": time,
      "toacc_number": toacc_number
    };
  }
}
