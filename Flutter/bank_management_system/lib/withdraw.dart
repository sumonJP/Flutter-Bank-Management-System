import 'package:flutter/material.dart';
import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
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
    home:Withdraw(),
  ),
  );
}

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _id=TextEditingController();
  TextEditingController _amount=TextEditingController();
  TextEditingController _password=TextEditingController();

  late List<Createaccount> _students = [];


  Future<List<Createaccount>> showbyid(String id, String amount, String password) async {
    final response = await http.get(Uri.parse(_ipaddress.add+'/createwithdraw/'+id+'/'+amount+'/'+password));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_id.text, _amount.text,_password.text);
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
        title: Text("Balance Withdraw",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.amber,
      ),


      body:Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children:<Widget>[
              SizedBox(height: 100,),

              Padding(
                padding: EdgeInsets.all(15),
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
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller:_amount ,
                  decoration: InputDecoration(
                    labelText: 'Withdraw Amount (tk)',
                    hintText: 'enter your amount',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15),
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
                child: Text('Submit',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                onPressed: () {
                  showid();

                  // if (_students != null) {
                  //   SnackBar snk =SnackBar(content: Text(_students.));
                  //   ScaffoldMessenger.of(context).showSnackBar(snk);
                  //   alert(this._students.msg);
                  // } else {
                  //   SnackBar snk =SnackBar(content: Text('Withdraw Successful'));
                  //   ScaffoldMessenger.of(context).showSnackBar(snk);
                  // }

                  setState(() {
                    SnackBar snk =SnackBar(content: Text('Withdraw Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);

                    this._id.text="";
                    this._amount.text="";
                    this._password.text="";

                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
