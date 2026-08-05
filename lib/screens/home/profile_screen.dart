import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState()=>_ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{

  final user = FirebaseAuth.instance.currentUser!;
  final emaiID = FirebaseAuth.instance.currentUser!.email;
  String name ='';

  @override
  void initState(){
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

  print("=====Document Exists: ${doc.exists}");
  print("=====Document ID: ${doc.id}");
  print("=====Data: ${doc.data()}");

  if (doc.exists) {
    setState(() {
      name = doc['name'];
    });
  } else {
    print("User document does not exist.");
  }
}

  Future<void> signout()async{
    await FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile",
          style: GoogleFonts.cormorantGaramond(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.black,),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white, size: 60),
            ),

            const SizedBox(height: 18),

            Text("unknown user",
              style: GoogleFonts.cormorantGaramond(fontSize: 30,fontWeight: FontWeight.bold,),
            ),

            const SizedBox(height: 6),

            Text( emaiID!,
              style: GoogleFonts.cormorantGaramond(fontSize: 18,color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            buildTile(icon: Icons.person_outline, title: "Edit Profile", onTap: () {},),

            buildTile(icon: Icons.lock_outline, title: "Privacy", onTap: () {}),

            buildTile(icon: Icons.settings_outlined,title: "Settings",onTap: () {},),

            buildTile(icon: Icons.info_outline, title: "About", onTap: () {}),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: ()=>signout(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                ),
                icon: const Icon(Icons.logout),
                label: Text("Logout",
                  style: GoogleFonts.cormorantGaramond(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color iconColor = Colors.black,
  }) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title,
          style: GoogleFonts.cormorantGaramond(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 18,color: Colors.black54,),
        onTap: onTap,
      ),
    );
  }

}



