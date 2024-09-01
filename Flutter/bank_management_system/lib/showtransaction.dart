import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:bank_management_system/model_class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/admindrawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Transaction> objectsFromJson(String str) =>
    List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));
String objectsToJson(List<Transaction> data) =>
    json.encode(List<Transaction>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Showtransaction() ,
  ),
  );
}

class Showtransaction extends StatefulWidget {
  const Showtransaction({super.key});

  @override
  State<Showtransaction> createState() => _ShowtransactionState();
}

class _ShowtransactionState extends State<Showtransaction> {
  // late List<Transaction> _alldata=[];

  Ipaddress _ipaddress=Ipaddress();

  Future<List<Transaction>> showalltransaction() async {
    final response =
    await http.get(Uri.parse(_ipaddress.add+'/getalltransaction'));
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
        title: Text('Show all Transaction', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,

        ),),
        backgroundColor: Colors.blue,
      ),
      body:ListView(
        children: [
          Container(
            height:700,
            child: FutureBuilder<List<Transaction>>(
              future: showalltransaction(),
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
                          color: Colors.amberAccent,
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
                                    'Account Number : '+snapshot.data![index].a_number.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Account Type : '+snapshot.data![index].a_type.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Previous Balance : '+snapshot.data![index].prebalance.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Transaction Amount : '+snapshot.data![index].tamount.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Current Balance : '+snapshot.data![index].curbalance.toString(),
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

                                  SizedBox(height:5),
                                  Text(
                                    'Time : '+snapshot.data![index].time.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'To Account : '+snapshot.data![index].toacc_number.toString(),
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
