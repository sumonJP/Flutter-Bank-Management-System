import 'package:bank_management_system/admindrawer.dart';
import 'package:bank_management_system/model_class/applyuseraccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Applyuseraccount> objectsFromJson(String str) =>
    List<Applyuseraccount>.from(json.decode(str).map((x) => Applyuseraccount.fromJson(x)));
String objectsToJson(List<Applyuseraccount> data) =>
    json.encode(List<Applyuseraccount>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   home:Showapplyforaccount(),
  ),
  );
}

class Showapplyforaccount extends StatefulWidget {
  const Showapplyforaccount({super.key});

  @override
  State<Showapplyforaccount> createState() => _ShowapplyforaccountState();
}

class _ShowapplyforaccountState extends State<Showapplyforaccount> {
  // late List<Applyuseraccount> _alldata=[];

  Ipaddress _ipaddress=Ipaddress();

  Future<List<Applyuseraccount>> showallapplication() async {
    final response =
    await http.get(Uri.parse(_ipaddress.add+'/showapplyforaccount'));
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
        title: Text('application account details'),
        backgroundColor: Colors.green,
      ),
      body:ListView(
          children: [
            Container(
              height:700,
              child: FutureBuilder<List<Applyuseraccount>>(
                future: showallapplication(),
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
                                      'Nid : '+snapshot.data![index].nid.toString(),
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

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        // ---------------------- listview akare ----------------------
                        // return GestureDetector(
                        //   child: Container(
                        //
                        //     margin: EdgeInsets.all(5),
                        //     width: double.infinity,
                        //     height: 20,
                        //     alignment: Alignment.topCenter,
                        //     decoration: BoxDecoration(
                        //       // border: Border.all(
                        //       //   color: Colors.black,
                        //       //   width: 3,
                        //       // )
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Text('Name : '+_alldata[index].name.toString()),
                        //         SizedBox(width: 10),
                        //         Text('Nid : '+_alldata[index].nid.toString()),
                        //         SizedBox(width: 10),
                        //         Text('Gender : '+_alldata[index].gender.toString()),
                        //         SizedBox(width: 10),
                        //       ],
                        //     ),
                        //   ),
                        // );

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
