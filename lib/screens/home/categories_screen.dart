import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Categories', style: GoogleFonts.cormorantGaramond(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.black,),),
        backgroundColor: Colors.white,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black)
      ),
      body: Center(
        child: Text('upcoming...'),
      ),
    );
  }
}
