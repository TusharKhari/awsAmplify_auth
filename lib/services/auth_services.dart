import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_amplify/confirmation_page.dart';
import 'package:aws_amplify/home_page.dart';
import 'package:aws_amplify/login_page.dart';
import 'package:flutter/material.dart';

class AuthServices {
  signUp(email, username, password, context) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: email,
      };
      Amplify.Auth.signUp(
          username: username,
          password: password,
          options: CognitoSignUpOptions(
            userAttributes: userAttributes,
          )).then((value) => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ConfirmationPage(
              username: username,
            ),
          )));
    } on AuthException catch (e) {
      print(e.message);
    }
  }
  // confirm user

  confirmUser(username, confirmationCode, context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      if (res.isSignUpComplete) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  signIn(username, password, context) async {
    try {
      Amplify.Auth.signIn(username: username, password: password)
          .then((value) => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              )));
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  signOut(context) async {
    SignOutResult res = await Amplify.Auth.signOut();
    Navigator.of(context).pop();

    }
  }

  Future<void> signOutCurrentUserGlobally() async {
    try {
              final response = await Amplify.Auth.getCurrentUser();
        print('Amplify.Auth.fetchAuthSession $response');

      await Amplify.Auth.signOut(options: SignOutOptions(globalSignOut: true));
      print('object');
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }
