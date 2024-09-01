import 'package:bank_management_system/userdrawer.dart';
import 'package:flutter/material.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Userpage",
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Myuserpage(),
    );
  }
}

class Myuserpage extends StatefulWidget {
  const Myuserpage({super.key});

  @override
  State<Myuserpage> createState() => _MyuserpageState();
}

class _MyuserpageState extends State<Myuserpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Userdrawer(),

      appBar: AppBar(
        centerTitle: true,
        title:Row(
          children: [
            Text('Welcome to ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

            Text('User ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),
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

                flex: 1,
                child:Container(
                  child: Image.asset('images/logo_user.jpg',
                    width: double.infinity,
                    height: 50,
                    fit: BoxFit.fill,
                  ),

                ),
              ),

              Expanded(
                flex: 1,
                child:Container(
                  child: Image.asset('images/user_logo2.jpg',
                    width: double.infinity,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  ),


                  // ------------------------------ icon + text dekhano ---------------------------

                  // child: Row(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Padding(
                  //                 padding: EdgeInsets.only(top: 10,left: 10),
                  //               child: ClipOval(
                  //                 child:Material(
                  //                   color:  Color(0xff007C00),
                  //
                  //                   child: InkWell(
                  //                     splashColor: Colors.yellow,
                  //                     child: Column(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       children:<Widget>[
                  //                         Icon(Icons.login,size: 60,),
                  //                         // Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  //                       ],
                  //                     ),
                  //                     onTap: (){
                  //                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  //                     },
                  //                   ),
                  //                 ),
                  //                 // child: Container(
                  //                 //   height: 50,
                  //                 //   width: 30,
                  //                 //   color: Colors.green,
                  //                 //   child: Icon(Icons.app_registration),
                  //                 //
                  //                 // ),
                  //               ),
                  //             ),
                  //             Padding(
                  //                 padding: EdgeInsets.only(left: 10,top: 10),
                  //               child: Text('Apply for Account'),
                  //               // child: TextButton(
                  //               //   child: Text('Apply for '),
                  //               // ),
                  //             ),
                  //
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

