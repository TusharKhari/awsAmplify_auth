import 'package:aws_amplify/services/auth_services.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  final username;

  const ConfirmationPage({super.key, required this.username});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('enter code')),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'confirmation code'),
            onChanged: (value) {
              setState(() {
                code = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                AuthServices().confirmUser(widget.username, code, context);
              },
              child: const Text('confirm'))
        ],
      ),
    );
  }
}
