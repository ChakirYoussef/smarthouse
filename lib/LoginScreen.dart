import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List users = [];
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var test = "Need an account?";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("data/db.json");
    final data = await json.decode(response);
    setState(() {
      users = data["users"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Text(
                "Smart House",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              //Icon(Icons.smart_toy_outlined),
              SizedBox(
                height: 20,
              ),
              Text('Sign In', style: TextStyle(fontSize: 24)),
              SizedBox(height: 16),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  label: Text("UserName"),
                  hintText: 'UserName',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16), // set the border radius here
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  // TODO: Sign up the user
                  readJson();
                  var username = userNameController.value.text;
                  var password = userNameController.value.text;
                  users.forEach((user) {
                    print('Name: ${user["name"]},   ${user["UserName"]}');
                    if (user["UserName"] == username) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
                    } else {
                      setState(() {
                        test = "Need an Account?";
                      });
                    }
                  });
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to the forgot password screen
                },
                child: Text('Forgot Password?'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need an account ?'),
                  TextButton(
                    child: Text("Sign Up"),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
