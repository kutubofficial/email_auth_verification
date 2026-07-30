import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
final currentUser = FirebaseAuth.instance.currentUser;

class _HomepageState extends State<Homepage> {
  String name ='';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

   fetchUserData() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

    setState(() {
      name = doc['name'];
    });
  }
  signout()async{
    await FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Home Screen'),),
      body: Center(
        child: Column(
          children: [
            Text('Hey $name , Welcom to Home Screen'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>signout(),child: Icon(Icons.login_rounded),),
    );
  }
}