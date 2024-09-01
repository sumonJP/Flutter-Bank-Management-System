import 'package:bank_management_system/admindrawer.dart';
import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Createaccount> objectsFromJson(String str) =>
    List<Createaccount>.from(json.decode(str).map((x) => Createaccount.fromJson(x)));
String objectsToJson(List<Createaccount> data) =>
    json.encode(List<Createaccount>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Showallcustomeraccount(),
  ),
  );
}

class Showallcustomeraccount extends StatefulWidget {
  const Showallcustomeraccount({super.key});

  @override
  State<Showallcustomeraccount> createState() => _ShowallcustomeraccountState();
}

class _ShowallcustomeraccountState extends State<Showallcustomeraccount> {
  // late List<Applyuseraccount> _alldata=[];

  Ipaddress _ipaddress=Ipaddress();

  Future<List<Createaccount>> showallaccount() async {
    final response =
    await http.get(Uri.parse(_ipaddress.add+'/showallCustomerData'));
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
        title: Text('Show All Customer Account',style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body:ListView(
        children: [
          Container(
            height:700,
            child: FutureBuilder<List<Createaccount>>(
              future: showallaccount(),
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
                            height: 330,
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children:<Widget>[

                                  SizedBox(height:5),
                                  Text(
                                    'Account Number : '+snapshot.data![index].a_number.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Account Type : '+snapshot.data![index].acctype.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Nid : '+snapshot.data![index].nid.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Name : '+snapshot.data![index].name.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Gender : '+snapshot.data![index].gender.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Phone : '+snapshot.data![index].mobile.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Email : '+snapshot.data![index].email.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Address : '+snapshot.data![index].address.toString(),
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
                                    'Marital Status : '+snapshot.data![index].mar_status.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Occupation : '+snapshot.data![index].occupation.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Balance : '+snapshot.data![index].balance.toString()+' tk',
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
