import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/authentication/login.dart';
import 'package:login_signup/widgets/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _forgotPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _forgotPassword.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value.trim())) {
    return 'Enter a valid email address';
  }
  return null;
}

Future<void> forgotPassword() async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _forgotPassword.text,);
    Get.snackbar('Message', 'Reset link sent! Check your email.');
  } on FirebaseAuthException catch (e) {
    
    Get.snackbar('error', e.message  ??' Something went wrong');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Forgot Password',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),backgroundColor: Colors.white,),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 160),
                Icon(Icons.lock,size: 60,color: Colors.black87,),
            
                const SizedBox(height: 24),
                 Text(
                  'Enter e-mail to receive reset link',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.w600),
                ),
            
                const SizedBox(height: 20),
            
                CustomTextField(
                  controller: _forgotPassword,
                  hintText: 'Enter your e-mail',
                  icon: Icons.email_outlined,
                  obscureText: false,
                  validator: validateEmail,
                ),
                const SizedBox(height: 32),
            
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        forgotPassword();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                    ),
                    child:  Text('Send Link',
                      style: GoogleFonts.cormorantGaramond(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
            
                // const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

}