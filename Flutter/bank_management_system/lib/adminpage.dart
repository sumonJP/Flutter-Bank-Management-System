import 'package:bank_management_system/admindrawer.dart';
import 'package:bank_management_system/main.dart';
import 'package:flutter/material.dart';

class Adminpage extends StatelessWidget {
  const Adminpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Admin page",
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Myadminpage(),
    );
  }
}

class Myadminpage extends StatefulWidget {
  const Myadminpage({super.key});

  @override
  State<Myadminpage> createState() => _MyadminpageState();
}

class _MyadminpageState extends State<Myadminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Admindrawer(),

      appBar: AppBar(
        centerTitle: true,
        title:Row(
          children: [
            Text('Welcome to  ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

            Text('Admin ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),
            Text('Panel',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24)),
          ],
        ),

        backgroundColor:Colors.white38,
      ),

      body:Center(

        child: Container(
          color: Color(0xff6649EF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(

                flex: 2,
                child:Container(
                  child: Image.asset('images/user_logo2.jpg',
                    width: double.infinity,
                    height: 50,
                    fit: BoxFit.fill,
                  ),

                ),
              ),

              Expanded(
                flex: 1,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(20),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              margin: EdgeInsets.all(30),
                              height: 100,
                              color: Colors.amber[500],
                              child: Center(
                                child:ElevatedButton(
                                  child: Text(
                                      'Logout',
                                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red)
                                  ),
                                  onPressed: (){
                                    SnackBar s = SnackBar(content: Text('logout successful'));
                                    ScaffoldMessenger.of(context).showSnackBar(s);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        // child: GridView.count(
                        //   crossAxisCount: 2,
                        //   // padding: EdgeInsets.all(0),
                        //   mainAxisSpacing: 5,
                        //   crossAxisSpacing: 10,
                        //   // primary: true,
                        //   children:<Widget> [
                        //     Container(
                        //       // padding: EdgeInsets.only(left: ),
                        //       margin: EdgeInsets.only(left: 60),
                        //       child: SizedBox.fromSize(
                        //          // size: Size(80,80),
                        //         child: ClipOval(
                        //           child: Material(
                        //             color:  Color(0xff007C00),
                        //
                        //             child: InkWell(
                        //               splashColor: Colors.yellow,
                        //               child: Column(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children:<Widget>[
                        //                   Icon(Icons.logout,size: 50,),
                        //                   Text('Logout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        //                 ],
                        //               ),
                        //               onTap: (){
                        //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        //               },
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //
                        //   ],
                        //
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

