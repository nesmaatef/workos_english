// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workos_english/screen/login.dart';
import 'package:workos_english/screen/tasks.dart';

class UserStatment extends StatelessWidget {
  const UserStatment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.data == null) {
            return Login();
          } else if (userSnapshot.hasData) {
            return Tasks();
          } else if (userSnapshot.hasError) {
            return Scaffold(body: Center(child: Text('this is error happend')));
          } else if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
          return Scaffold(
            body: Center(child: Text('something error')),
          );
        });
  }
}
