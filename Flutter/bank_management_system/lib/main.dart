import 'package:bank_management_system/login.dart';
import 'package:bank_management_system/userpage.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/homedrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Homedrawer(),

      appBar: AppBar(
        centerTitle: true,
        title:Row(
          children: [
            Text('Bank ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

            Text('Management ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),
            Text('System',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24)),
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
                    child: Image.asset('images/bank.jpg',
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
                        SizedBox(height: 100),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            // padding: EdgeInsets.all(0),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            // primary: true,
                            children:<Widget> [
                              Container(
                                padding: EdgeInsets.all(3),
                                child: SizedBox.fromSize(
                                  // size: Size(50,50),
                                  child: ClipOval(
                                    child: Material(
                                      color:  Color(0xff007C00),

                                      child: InkWell(
                                        splashColor: Colors.yellow,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:<Widget>[
                                            Icon(Icons.login,size: 60,),
                                            Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(3),
                                child: SizedBox.fromSize(
                                  // size: Size(50,50),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.yellowAccent,
                                      child: InkWell(
                                        splashColor: Colors.green,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:<Widget>[
                                            Icon(Icons.person,size: 60,),
                                            Text('Customer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Userpage()));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(3),
                                child: SizedBox.fromSize(
                                  // size: Size(50,50),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.teal,
                                      child: InkWell(
                                        splashColor: Colors.red,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:<Widget>[
                                            Icon(Icons.search,size: 60,),
                                            Text('Search',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        onTap: (){
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Userpage()));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],

                          ),
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
