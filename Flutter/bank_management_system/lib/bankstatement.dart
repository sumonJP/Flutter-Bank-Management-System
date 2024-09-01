import 'package:bank_management_system/model_class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:bank_management_system/model_class/ipaddress.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Transaction> objectsFromJson(String str) =>
    List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));
String objectsToJson(List<Transaction> data) =>
    json.encode(List<Transaction>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Bankstatement(),
  ),
  );
}

class Bankstatement extends StatefulWidget {
  const Bankstatement({super.key});

  @override
  State<Bankstatement> createState() => _BankstatementState();
}

class _BankstatementState extends State<Bankstatement> {
  Ipaddress _ipaddress=Ipaddress();

  TextEditingController _account=TextEditingController();
  TextEditingController _preDate=TextEditingController();
  TextEditingController _nextDate=TextEditingController();

  late List<Transaction> _getData = [];


  Future<List<Transaction>> showbyid(String a_number, String predate, String nextdate) async {
    final response = await http.get(Uri.parse(_ipaddress.add+'/bankstatement/'+a_number+'/'+predate+'/'+nextdate));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  // ----------------------- Date  arif vai er part --------------------------

  // Future<void> _selectPreviousDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (pickedDate != null && pickedDate != DateTime.now()) {
  //     _preDate.text = "${pickedDate.toLocal()}".split(' ')[0];
  //   }
  // }
  //
  // Future<void> _selectNextDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (pickedDate != null && pickedDate != DateTime.now()) {
  //     _nextDate.text = "${pickedDate.toLocal()}".split(' ')[0];
  //   }
  // }

  void showid()async{
    _getData = await showbyid(_account.text, _preDate.text,_nextDate.text);
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
        title: Text("Show Bank Statement",
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
              SizedBox(height:10,),

              Padding(
                // padding: EdgeInsets.fromLTRB(35,0,15,10),
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_account ,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Account Number',
                    hintText: 'Enter Account number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_preDate ,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    labelText: 'Previous Date',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),

                  // readOnly: true,
                  // onTap: () => _selectPreviousDate(context),

                  onTap: () async{
                    DateTime? pickeddate= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100)
                    );
                    if(pickeddate!=null && pickeddate != DateTime.now()){
                      _preDate.text="${pickeddate.toLocal()}".split(' ')[0];
                    }
                  },



                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_nextDate ,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      labelText: 'Next Date',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),

                  // readOnly: true,
                  // onTap: () => _selectNextDate(context),


                  onTap: () async{
                    DateTime? pickeddate= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100)
                    );
                    if(pickeddate!=null && pickeddate != DateTime.now()){
                      _nextDate.text="${pickeddate.toLocal()}".split(' ')[0];
                    }
                  },


                ),
              ),

              ElevatedButton(
                child: Text('Submit',
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
              SizedBox(
                height: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    child: FutureBuilder<List<Transaction>>(
                      future: showbyid(_account.text, _preDate.text,_nextDate.text),

                      // --------------- table akare show korano -------------------

                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Transaction> customers = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: [
                                  DataColumn(label: Text('Trans. Id')),
                                  DataColumn(label: Text('Trans. Type')),
                                  DataColumn(label: Text('Acc. Number')),
                                  DataColumn(label: Text('Acc.Type')),
                                  DataColumn(label: Text('Pre. Balance')),
                                  DataColumn(label: Text('Trans. Amount')),
                                  DataColumn(label: Text('Curr. Balance')),
                                  DataColumn(label: Text('Date')),
                                  DataColumn(label: Text('Time')),
                                  DataColumn(label: Text('To Acc. Number'))
                                ],
                                rows: customers.map((customer) {
                                  return DataRow(cells: [
                                    DataCell(Text(customer.tid.toString())),
                                    DataCell(Text(customer.ttype.toString())),
                                    DataCell(Text(customer.a_number.toString())),
                                    DataCell(Text(customer.a_type.toString())),
                                    DataCell(Text(customer.prebalance.toString())),
                                    DataCell(Text(customer.tamount.toString())),
                                    DataCell(Text(customer.curbalance.toString())),
                                    DataCell(Text(customer.date.toString())),
                                    DataCell(Text(customer.time.toString())),
                                    DataCell(Text(customer.toacc_number.toString())),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("( Please enter correct information)",
                            style: TextStyle(fontSize: 20,color: Colors.red),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },

                      // -------------- card akare show korano ----------------------

                      // builder: (context, snapshot){
                      //   if(snapshot.hasData){
                      //     return ListView.builder(
                      //       itemCount: snapshot.data!.length,
                      //       itemBuilder: (context, index){
                      //         return Center(
                      //           child: Card(
                      //             margin: EdgeInsets.only(top:10),
                      //             elevation: 50,
                      //             shadowColor: Colors.black,
                      //             color: Colors.lightGreenAccent,
                      //             child: SizedBox(
                      //               width: 300,
                      //               height: 320,
                      //               child: Padding(
                      //                 padding: EdgeInsets.all(20),
                      //                 child: Column(
                      //                   children:<Widget>[
                      //                     SizedBox(height:10),
                      //                     Text('Tran. Type : '+
                      //                         snapshot.data![index].ttype.toString(),
                      //                       style: TextStyle(
                      //                         fontSize: 20,
                      //                         fontWeight: FontWeight.bold,
                      //                         color: Colors.black,
                      //                       ),
                      //                     ),
                      //                     SizedBox(height: 10),
                      //                     Text('Account : '+
                      //                         snapshot.data![index].a_number.toString()+' tk',
                      //                       style: TextStyle(
                      //                           fontSize: 18,
                      //                           fontWeight: FontWeight.bold,
                      //                           color: Colors.black
                      //                       ),
                      //                     ),
                      //
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //
                      //
                      //       },);
                      //
                      //   }else if(snapshot.hasError){
                      //     return Text("( Please enter correct information)",
                      //       style: TextStyle(fontSize: 20,color: Colors.red),
                      //     );
                      //   }else{
                      //     return CircularProgressIndicator();
                      //   }
                      // },
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
