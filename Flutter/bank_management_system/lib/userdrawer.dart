import 'package:bank_management_system/applyaccount.dart';
import 'package:bank_management_system/checkbalance.dart';
import 'package:bank_management_system/main.dart';
import 'package:bank_management_system/moneytransfer.dart';
import 'package:bank_management_system/userpage.dart';
import 'package:bank_management_system/withdraw.dart';
import 'package:flutter/material.dart';

class Userdrawer extends StatelessWidget {
  const Userdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff007C00),
               image: DecorationImage(image: AssetImage('images/user_logo2.jpg'),fit: BoxFit.cover)
            ),
            padding: EdgeInsets.fromLTRB(5.0,10,0,0),  // Set padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 105),
                Row(
                  children: [
                    Text('User ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

                    Text('Panel ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),
                  ],
                ),
              ],
            ),
          ),


          // ---------------- drawer body --------------------------

          ListTile(
            leading: Icon(Icons.home,color: Colors.red),
            title: Text(
                'Home',
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text(
                'Apply for account',
              style: TextStyle(fontSize: 18),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Applyaccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.balance),
            title: Text(
              'Check Balance',
              style: TextStyle(fontSize: 18),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkbalance()));
            },
          ),

          ListTile(
            leading: Icon(Icons.balance),
            title: Text(
              'Withdraw',
              style: TextStyle(fontSize: 18),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Withdraw()));
            },
          ),

          ListTile(
            leading: Icon(Icons.balance),
            title: Text(
              'Money Transfer',
              style: TextStyle(fontSize: 18),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Moneytransfer()));
            },
          ),

        ],
      ),
    );
  }
}
