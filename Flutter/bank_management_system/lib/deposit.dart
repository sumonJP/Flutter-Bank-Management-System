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
    home:Deposit(),
  ),
  );
}

class Deposit extends StatefulWidget{
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _accnumber=TextEditingController();
  TextEditingController _amount=TextEditingController();

  late List<Createaccount> _students = [];


  Future<List<Createaccount>> showbyid(String a_number,String amount) async {
    final response = await http.get(Uri.parse(_ipaddress.add+'/createdeposit/'+a_number+'/'+amount));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_accnumber.text, _amount.text);
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
        title: Text("Balance Deposit",
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
                  controller:_accnumber ,
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
                  controller:_amount ,
                  decoration: InputDecoration(
                    labelText: 'Deposit Amount (tk)',
                    hintText: 'enter your amount',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              ElevatedButton(
                child: Text('Confirm',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                onPressed: () {
                  showid();
                  setState(() {
                    SnackBar snk =SnackBar(content: Text('Deposit Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                    this._accnumber.text="";
                    this._amount.text="";
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
