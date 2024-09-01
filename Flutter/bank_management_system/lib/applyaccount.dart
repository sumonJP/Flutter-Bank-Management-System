import 'dart:convert';
import 'package:bank_management_system/model_class/applyuseraccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:bank_management_system/userpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List<Applyuseraccount> objectsFromJson(String str) =>
    List<Applyuseraccount>.from(
        json.decode(str).map((x) => Applyuseraccount.fromJson(x)));
String objectsToJson(List<Applyuseraccount> data) =>
    json.encode(List<Applyuseraccount>.from(data).map((x) => x.toJson()));



class Applyaccount extends StatefulWidget {
  const Applyaccount({super.key});

  @override
  State<Applyaccount> createState() => _ApplyaccountState();
}

class _ApplyaccountState extends State<Applyaccount> {
  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _nid = TextEditingController();
  TextEditingController _acctype = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _mar_status = TextEditingController();
  TextEditingController _occupation = TextEditingController();

  Future<Applyuseraccount> applyforaccount() async {
    Applyuseraccount s = Applyuseraccount(
        nid: double.parse(_nid.text),
        acctype: _acctype.text,
        name: _name.text,
        gender: _gender.text,
        mobile: _mobile.text,
        email: _email.text,
        address: _address.text,
        date: _date.text,
        mar_status: _mar_status.text,
        occupation: _occupation.text
    );
    final response = await http.post(
        Uri.parse(_ipaddress.add+'/createaccount'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      return Applyuseraccount.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Application For New Account',style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_nid ,
                  decoration: InputDecoration(
                    labelText: 'Nid',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_acctype ,
                  decoration: InputDecoration(
                    labelText: 'Account Type',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_name ,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_gender ,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_mobile ,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_email ,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_address ,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_date ,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    icon: Icon(Icons.calendar_today_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),

                  onTap: () async{
                    DateTime? pickeddate= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100)
                    );
                    if(pickeddate!=null && pickeddate != DateTime.now()){
                      _date.text="${pickeddate.toLocal()}".split(' ')[0];
                    }
                  },
                ),
              ),


              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_mar_status ,
                  decoration: InputDecoration(
                    labelText: 'Marital Status',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_occupation ,
                  decoration: InputDecoration(
                    labelText: 'Occupation',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),


              ElevatedButton(
                child: Text('Apply',
                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                onPressed: () async{
                  Applyuseraccount st= await applyforaccount();

                  if(st!=null){
                    SnackBar snk =SnackBar(content: Text('Application Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Userpage()));
                  }else if(_nid.text.length==0){
                    SnackBar snk =SnackBar(content: Text('enter correct information'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
