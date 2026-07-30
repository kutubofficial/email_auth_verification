import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/authentication/forgot_password.dart';
import 'package:login_signup/authentication/signup.dart';
import 'package:login_signup/widgets/custom_text_field.dart';
import 'package:login_signup/widgets/social_buttons.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
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
                  const SizedBox(height: 40),
                  Icon(Icons.spa_outlined,size: 60,color: Colors.black87,),
              
                  const SizedBox(height: 24),
                   Text(
                    'Welcome back, you have been missed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cormorantGaramond(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.w500),
                  ),
              
                  const SizedBox(height: 20),
              
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
                    obscureText: _obscurePassword,
                  ),
              
                  const SizedBox(height: 2),
              
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder:(context)=> const ForgotPassword()));
                      },
                      child:  Text(
                        'Forgot Password?',
                        style: GoogleFonts.cormorantGaramond(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 32),
              
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: ()=> signIn(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                      ),
                      child:  Text('Sign In',
                        style: GoogleFonts.cormorantGaramond(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),
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
                       Text('Not a member? ',
                        style: GoogleFonts.cormorantGaramond(color: Colors.grey[700],fontSize: 15,fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,MaterialPageRoute(builder: (context) => const SignupScreen(),),
                          );
                        },
                        child:  Text('Register now',
                           style: GoogleFonts.cormorantGaramond(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
              
                  // const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}