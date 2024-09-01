import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Createaccount> objectsFromJson(String str) =>
    List<Createaccount>.from(json.decode(str).map((x) => Createaccount.fromJson(x)));
String objectsToJson(List<Createaccount> data) =>
    json.encode(List<Createaccount>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Moneytransfer(),
  ),
  );
}

class Moneytransfer extends StatefulWidget {
  const Moneytransfer({super.key});

  @override
  State<Moneytransfer> createState() => _MoneytransferState();
}

class _MoneytransferState extends State<Moneytransfer> {
  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _fromaccount=TextEditingController();
  TextEditingController _toaccount=TextEditingController();
  TextEditingController _amount=TextEditingController();
  TextEditingController _password=TextEditingController();

  late List<Createaccount> _students = [];


  Future<List<Createaccount>> showbyid(String fromaccount, String toaccount, String amount, String password) async {
    final response = await http.get(Uri.parse(_ipaddress.add+'/balancetransfer/'+fromaccount+'/'+toaccount+'/'+amount+'/'+password));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_fromaccount.text, _toaccount.text,_amount.text, _password.text );
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
        title: Text("Money Transfer",
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
              SizedBox(height: 140,),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_fromaccount ,
                  decoration: InputDecoration(
                    labelText: 'From Account Number',
                    hintText: 'enter  account number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_toaccount ,
                  decoration: InputDecoration(
                    labelText: 'To Account Number',
                    hintText: 'enter  account number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_amount ,
                  decoration: InputDecoration(
                    labelText: 'Transfer Amount (tk)',
                    hintText: 'enter  your amount',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
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
                  setState(() {
                    SnackBar snk =SnackBar(content: Text('Transfer Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                    this._fromaccount.text="";
                    this._amount.text="";
                    this._toaccount.text="";
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
