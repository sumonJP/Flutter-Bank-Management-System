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
    home:Customerinfo(),
  ),
  );
}

class Customerinfo extends StatefulWidget {
  const Customerinfo({super.key});

  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {

  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _id = TextEditingController();

  // String searchid = "";
  late List<Createaccount> _students = [];

  Future<List<Createaccount>> showbyid(String id) async {
    // var response;
    //
    // if(id.length == 0 ){
    //   response = await http.get(
    //     Uri.parse('http://192.168.0.104:8080/search/'+id),
    //   );
    // }else{
    //   response = await http.get(
    //     Uri.parse('http://192.168.0.104:8080/search/'+id),
    //   );
    // }

   final response = await http.get(Uri.parse(_ipaddress.add+'/search/'+id));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_id.text);
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
      drawer: Admindrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search By Acc.Number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,

          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        // -------------------------- Sir er code // easy ta Check balance.dart <<<<============
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              padding: EdgeInsets.only(left: 10),
              child: Form(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _id,

                        // validator: (String? value) {
                        //   if (value!.isEmpty) {
                        //     return 'please enter id';
                        //   }
                        // },

                        decoration: InputDecoration(

                            labelText: 'Account Number',
                            hintText: 'Enter your account number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_id.text.length == 0) {
                            //   //showall();
                            // } else {
                            //   searchid = _id.text;
                            // }
                            // searchid = _id.text;
                            showid();

                            setState(() {});
                          },
                          child: Text("Search",
                            style: TextStyle(fontSize: 20,height:2.5),
                          ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 500,
              child: FutureBuilder<List<Createaccount>>(
                future: showbyid(_id.text),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        return Center(
                          child: Card(
                            margin: EdgeInsets.only(top: 70),
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
                    return Text("( Please enter correct account number )",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red,
                        ),
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
