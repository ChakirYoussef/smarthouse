

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "User 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Security",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_sharp),
            title:
            Text("Users", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title:
            Text("Alerts", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 80,
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title:
            Text("Theme", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title:
            Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );;
  }
}
