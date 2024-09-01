import 'package:bank_management_system/adminpage.dart';
import 'package:bank_management_system/bankstatement.dart';
import 'package:bank_management_system/customerinfo.dart';
import 'package:bank_management_system/deposit.dart';
import 'package:bank_management_system/loanstatement.dart';
import 'package:bank_management_system/main.dart';
import 'package:bank_management_system/payinstallment.dart';
import 'package:bank_management_system/showallcustomeraccount.dart';
import 'package:bank_management_system/showapplyforaccount.dart';
import 'package:bank_management_system/showloantransaction.dart';
import 'package:bank_management_system/showtransaction.dart';
import 'package:flutter/material.dart';

class Admindrawer extends StatelessWidget {
  const Admindrawer({super.key});

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
                    Text('Admin ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

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
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text('Show apply for account'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showapplyforaccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text('View customer accounts'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showallcustomeraccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Customer Details'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerinfo()));
            },
          ),

          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Deposit Balance'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Deposit()));
            },
          ),

          ListTile(
            leading: Icon(Icons.payments_outlined),
            title: Text('Pay installment'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payinstallment()));
            },
          ),

          ListTile(
            leading: Icon(Icons.local_atm),
            title: Text('Loan Statement'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Loanstatement()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_cozy_outlined),
            title: Text('Bank Statement'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Bankstatement()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_array_outlined),
            title: Text('View Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showtransaction()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_cozy_outlined),
            title: Text('View Loan Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showloantransaction()));
            },
          ),

          // SizedBox(height: 20),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

          ListTile(
            leading: Icon(Icons.gpp_bad_outlined),
            title: Text('Back Admin Page'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminpage()));
            },
          ),

        ],
      ),
    );
  }
}
