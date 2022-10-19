// ignore_for_file: prefer_const_constructors

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_amplify/login_page.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';

//  amplify auth console  run in terminal 
// https://ap-northeast-1.console.aws.amazon.com/cognito/users/?region=ap-northeast-1#/pool/ap-northeast-1_33tMViVq5/details?_k=36jhwg
// tusharkhari1@gmail.com Tusharkhari@1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  late AmplifyAuthCognito auth;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print('already configured');
    }
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print('configure false');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: 
      //
      _amplifyConfigured == true
          ? const LoginPage()
          : const Text('loading'),
   //   LoginPage(),
    ));
  }
}
