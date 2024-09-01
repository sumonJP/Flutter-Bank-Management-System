import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:bank_management_system/model_class/loantransaction.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/model_class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/admindrawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Loantransaction> objectsFromJson(String str) =>
    List<Loantransaction>.from(json.decode(str).map((x) => Loantransaction.fromJson(x)));
String objectsToJson(List<Loantransaction> data) =>
    json.encode(List<Loantransaction>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Showloantransaction() ,
  ),
  );
}

class Showloantransaction extends StatefulWidget {
  const Showloantransaction({super.key});

  @override
  State<Showloantransaction> createState() => _ShowloantransactionState();
}

class _ShowloantransactionState extends State<Showloantransaction> {

  Ipaddress _ipaddress=Ipaddress();

  // late List<Loantransaction> _alldata=[];
  Future<List<Loantransaction>> showallloantransaction() async {
    final response =
    await http.get(Uri.parse(_ipaddress.add+'/showallloantransaction'));
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Admindrawer(),
      appBar: AppBar(
        title: Text('Show all Loan Transaction', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,

        ),
        ),
        backgroundColor: Colors.green,
      ),
      body:ListView(
        children: [
          Container(
            height:700,
            child: FutureBuilder<List<Loantransaction>>(
              future: showallloantransaction(),
              builder: (context, snapshot) {
                // _alldata=snapshot.data!;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext  context, index) {
                      return Center(
                        child: Card(
                          elevation: 50,
                          shadowColor: Colors.red,
                          color: Colors.amber,
                          child: SizedBox(
                            width: 350,
                            height: 280,
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children:<Widget>[
                                  SizedBox(height:5),
                                  Text(
                                    'Transaction Id : '+snapshot.data![index].tid.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Transaction Type : '+snapshot.data![index].ttype.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Account Number : '+snapshot.data![index].accnumber.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Loan Type : '+snapshot.data![index].loantype.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Total Installment : '+snapshot.data![index].totalinstallment.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Pay Installment : '+snapshot.data![index].payinstallment.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Paid Amount : '+snapshot.data![index].paidamount.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Due Amount : '+snapshot.data![index].dueamount.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Date : '+snapshot.data![index].date.toString(),
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
                  return Text("Error");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
