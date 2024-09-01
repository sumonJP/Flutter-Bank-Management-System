import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Createaccount> objectsFromJson(String str) =>
    List<Createaccount>.from(json.decode(str).map((x) => Createaccount.fromJson(x)));
String objectsToJson(List<Createaccount> data) =>
    json.encode(List<Createaccount>.from(data).map((x) => x.toJson()));

// ------------ only ai page Run korano --------------
main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Checkbalance(),
  ),
  );
}


class Checkbalance extends StatefulWidget {
  const Checkbalance({super.key});

  @override
  State<Checkbalance> createState() => _CheckbalanceState();
}

class _CheckbalanceState extends State<Checkbalance> {

  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _id=TextEditingController();
  TextEditingController _password=TextEditingController();

  late List<Createaccount> _students = [];


  Future<List<Createaccount>> showbyid(String id,String password) async {
    final response = await http.get(Uri.parse(_ipaddress.add+'/getAndCheck/'+id+'/'+password));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_id.text, _password.text);
    setState(() {

    });
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
        title: Text("Account Balance Check",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,

          ),
        ),
        backgroundColor: Colors.amber,
      ),


      body:Form(

          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children:<Widget>[
                SizedBox(height: 70,),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller:_id ,
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      hintText: 'enter your account number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    obscureText: true,
                    controller:_password ,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'enter your password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),

                ElevatedButton(
                  child: Text('Login',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                  onPressed: () {
                    showid();

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                      child: FutureBuilder<List<Createaccount>>(
                        future: showbyid(_id.text, _password.text),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){
                                return Center(
                                  child: Card(
                                    margin: EdgeInsets.only(top: 60),
                                    elevation: 50,
                                    shadowColor: Colors.black,
                                    color: Colors.lightGreenAccent,
                                    child: SizedBox(
                                      width: 300,
                                      height: 320,
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children:<Widget>[
                                            CircleAvatar(
                                              radius: 100,
                                              backgroundImage: NetworkImage(snapshot.data![index].img.toString()),
                                            ),
                                            SizedBox(height:10),
                                            Text('Name : '+
                                                snapshot.data![index].name.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('Your Balance : '+
                                                snapshot.data![index].balance.toString()+' tk',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );


                              },);

                          }else if(snapshot.hasError){
                            return Text("( Please enter correct information)",
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),
                            );
                          }else{
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
