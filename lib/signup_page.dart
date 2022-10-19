// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import 'package:aws_amplify/login_page.dart';
import 'package:aws_amplify/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? username, password, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("signUp"),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  Text('after signing up with valid email login with the same username and password'),
            Container(
              padding: const EdgeInsets.all(8),
              height: 390,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                   Text('after signing up with valid email login with the same username and password'),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Username'),
                    onChanged: (val) {
                      setState(() {
                        username = val;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'password'),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AuthServices()
                        //.signOut(context);
                             .signUp(email, username, password, context);
                      },
                      child: Text('SIGN UP ')),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('  SIGN IN')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
