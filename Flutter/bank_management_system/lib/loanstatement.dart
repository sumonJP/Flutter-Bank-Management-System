import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:bank_management_system/model_class/loantransaction.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Loantransaction> objectsFromJson(String str) => List<Loantransaction>.from(
    json.decode(str).map((x) => Loantransaction.fromJson(x)));
String objectsToJson(List<Loantransaction> data) =>
    json.encode(List<Loantransaction>.from(data).map((x) => x.toJson()));

// ------------ only ai page Run korano --------------
main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loanstatement(),
    ),
  );
}

class Loanstatement extends StatefulWidget {
  const Loanstatement({super.key});

  @override
  State<Loanstatement> createState() => _LoanstatementState();
}

class _LoanstatementState extends State<Loanstatement> {
  Ipaddress _ipaddress = Ipaddress();

  TextEditingController _id = TextEditingController();
  late List<Loantransaction> _students = [];

  Future<List<Loantransaction>> showbyid(String id) async {
    final response = await http
        .get(Uri.parse(_ipaddress.add + '/searchAndgetloanstate/' + id));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid() async {
    _students = await showbyid(_id.text);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    //show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Admindrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "View Loan Statement",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.amber,
      ),

      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _id,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                    hintText: 'enter your account number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  showid();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 530,
                    child: FutureBuilder<List<Loantransaction>>(
                      future: showbyid(_id.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Card(
                                  margin: EdgeInsets.only(top: 15),
                                  elevation: 50,
                                  shadowColor: Colors.black,
                                  color: Colors.lightGreenAccent,
                                  child: SizedBox(
                                    width: 320,
                                    height: 280,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 2),
                                          Text(
                                            'Transaction Id : ' +
                                                snapshot.data![index].tid
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Transaction Type : ' +
                                                snapshot.data![index].ttype
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Account Number : ' +
                                                snapshot.data![index].accnumber
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Loan Type : ' +
                                                snapshot.data![index].loantype
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Total Installment : ' +
                                                snapshot.data![index]
                                                    .totalinstallment
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Paid Installment : ' +
                                                snapshot
                                                    .data![index].payinstallment
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Paid Amount : ' +
                                                snapshot.data![index].paidamount
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Due Amount : ' +
                                                snapshot.data![index].dueamount
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Date & Time : ' +
                                                snapshot.data![index].date
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            "( Please enter correct information)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
