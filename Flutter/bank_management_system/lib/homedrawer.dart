import 'package:bank_management_system/adminpage.dart';
import 'package:bank_management_system/login.dart';
import 'package:bank_management_system/main.dart';
import 'package:bank_management_system/userpage.dart';
import 'package:flutter/material.dart';

class Homedrawer extends StatelessWidget {
  const Homedrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/logo_user.jpg'),fit: BoxFit.fill)
            ),
            padding: EdgeInsets.all(20.0),  // Set padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage('https://st4.depositphotos.com/20523700/25947/i/450/depositphotos_259477098-stock-photo-illustration-bank-icon.jpg'),
                ),
                SizedBox(height: 12),

               Row(
                 children: [
                   Text('Bank ', style: TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold,fontSize: 24)),

                   Text('Services ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),

                 ],
               ),

              ],
            ),
          ),

          // ---------------- drawer body --------------------------

          ListTile(
            leading: Icon(Icons.home,size: 30,),
            title: Text('Home',style: TextStyle(fontSize: 20)),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

          ListTile(
            leading: Icon(Icons.person,size: 30,),
            title: Text('Profile',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),

          ListTile(
            leading: Icon(Icons.design_services,size: 30,),
            title: Text('Services',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),

          ListTile(
            leading: Icon(Icons.email,size: 30,),
            title: Text('Message',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.query_stats,size: 30,),
            title: Text('Stats',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),

          ListTile(
            leading: Icon(Icons.share,size: 30,),
            title: Text('Share',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),

          ListTile(
            leading: Icon(Icons.notifications_active,size: 30,),
            title: Text('Notification',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 30,),
            title: Text('Settings',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),
          SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.logout,size: 30,),
            title: Text('Signout',style: TextStyle(fontSize: 20)),
            onTap: (){
            },
          ),

        ],
      ),
    );
  }
}


