import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/authentication/wrapper.dart';
import 'package:login_signup/widgets/custom_text_field.dart';
import 'package:login_signup/widgets/social_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


Future<void> signup() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'name': _nameController.text,
      'email': _emailController.text,
      'createdAt': FieldValue.serverTimestamp(),
    });

    Get.offAll(Wrapper());
  } on FirebaseAuthException catch (e) {
    Get.snackbar('Signup failed', e.message ?? 'Something went wrong');
  } catch (e) {
    Get.snackbar('Error', e.toString());
  }
}

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -MediaQuery.of(context).padding.top -MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                const Icon(Icons.spa,size: 60,color: Colors.black87,),

                const SizedBox(height: 24),
                Text(
                  'Create an account, it\'s free!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your name',
                  icon: Icons.person_outline,
                  obscureText: false,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your e-mail',
                  icon: Icons.email_outlined,
                  obscureText: false,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){
                      signup();
                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                    ),
                    child:  Text('Sign Up',
                      style: GoogleFonts.cormorantGaramond(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Or continue with',
                        style: GoogleFonts.cormorantGaramond(color: Colors.grey[700], fontSize: 15,fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      icon: 'assets/icons/google.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      icon: 'assets/icons/apple.svg',
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('Already a member? ',
                      style: GoogleFonts.cormorantGaramond(color: Colors.grey[700],fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.pop(context),
                      child: Text('Login now',
                         style: GoogleFonts.cormorantGaramond(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}