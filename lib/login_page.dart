// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import 'package:aws_amplify/services/auth_services.dart';
import 'package:aws_amplify/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Username'),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  AuthServices()
                      .signIn(username, password, context);
                    //  .signOutCurrentUserGlobally();
                },
                child: Text('SIGN IN ')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ));
                },
                child: Text('SIGN UP')),
          ],
        ),
      ),
    );
  }
}


// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? username, password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               height: 300,
//               width: MediaQuery.of(context).size.width - 30,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.7),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(hintText: 'Username'),
//                     onChanged: (val) {
//                       setState(() {
//                         username = val;
//                       });
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(hintText: 'password'),
//                     onChanged: (val) {
//                       setState(() {
//                         password = val;
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
                 
//                 ],
//               ),
//             ),
//              TextButton(onPressed: () {
                    
//                   }, child: Text('SIGN IN ')),
//                   // ElevatedButton(onPressed: () {}, child: Text('SIGN IN ')),
//                   // SizedBox(
//                   //   height: 10,
//                   // ),
//                   ElevatedButton(onPressed: () {
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //     builder: (context) => SignUpPage(),
//                       //   ));
//                   }, child: Text('SIGN UP')),
//           ],
//         ),
//       ),
//     );
//   }
// }
