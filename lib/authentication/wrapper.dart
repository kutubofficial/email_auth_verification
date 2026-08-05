import 'package:flutter/material.dart';
import 'package:login_signup/authentication/email_verify.dart';
import 'package:login_signup/authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/screens/home/home_wrapper.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          if(snapshot.data!.emailVerified){
            return HomeWrapper();
          }else{
             return EmailVerify();
          }
        }else{
          return LoginScreen();
        }
      }),
    );
  }
}