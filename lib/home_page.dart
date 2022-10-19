import 'package:aws_amplify/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('sign in successfull'),
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  AuthServices().signOut(context);
                },
                child: Text('SIGN OUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
