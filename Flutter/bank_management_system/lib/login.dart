import 'package:bank_management_system/adminpage.dart';
import 'package:bank_management_system/model_class/admin.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Admin> objectsFromJson(String str) =>
    List<Admin>.from(
        json.decode(str).map((x) => Admin.fromJson(x)));
String objectsToJson(List<Admin> data) =>
    json.encode(List<Admin>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Login(),
  ),
  );
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _id=TextEditingController();
  TextEditingController _password=TextEditingController();

  Future<Admin> adminlogin() async{
    Admin s=Admin(id: int.parse(_id.text), password: _password.text, name:"", gender:"", email: "", phone: "", address: "");
    final response=await http.post(
        Uri.parse(_ipaddress.add+'/loginadmin'),
        body:jsonEncode(s.toJson()),
        headers: {"content-type":"application/json"}
    );

    if(response.statusCode==200){
      return Admin.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Admin Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
        centerTitle: true,
      ),

      body: Form(

          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children:<Widget>[
                SizedBox(height: 100,),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller:_id ,
                    decoration: InputDecoration(
                      labelText: 'Id',
                      hintText: 'enter your id',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller:_password ,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'enter your password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),

                ElevatedButton(
                  child: Text('Login',
                    style: TextStyle(fontSize: 25,color: Colors.white),
                  ),
                  onPressed: () async{
                    Admin s= await adminlogin();
                    if( s !=null && s.id==int.parse(_id.text ) && s.password==_password.text) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminpage()));
                    }else{
                      SnackBar snk =SnackBar(content: Text('Enter correct information'));
                      ScaffoldMessenger.of(context).showSnackBar(snk);
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Showall()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                ),



                // ----------------------- Extra // login er bitor ya o condition kora --------------------

                // ElevatedButton(
                //   child: Text('Login'),
                //   onPressed: () async{
                //     Admin s= await adminlogin();
                //     if( s !=null && s.id==int.parse(_id.text ) && s.password==_password.text) {
                //       if(s.round=='57'){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Showall()));
                //       }else if(s.round=='58'){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                //       }else if(s.round=='59'){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchid()));
                //       }
                //
                //     }else{
                //       SnackBar snk =SnackBar(content: Text('enter correct information'));
                //       ScaffoldMessenger.of(context).showSnackBar(snk);
                //     }
                //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Showall()));
                //   },
                // ),




              ],
            ),
          ),
        ),

    );
  }
}
