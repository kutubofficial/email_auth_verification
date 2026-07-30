import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/authentication/wrapper.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool _isSending = false;
  bool _isChecking = false;

  @override
  void initState() {
    super.initState();
    sendVerifyLink();
  }

  Future<void> sendVerifyLink() async {
    setState(() => _isSending = true);
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      Get.snackbar('Link sent', 'A verification link has been sent to your email');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Something went wrong');
    } finally {
      setState(() => _isSending = false);
    }
  }

  Future<void> reload() async {
    setState(() => _isChecking = true);
    await FirebaseAuth.instance.currentUser!.reload();

    final isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    setState(() => _isChecking = false);

    if (isVerified) {
      Get.offAll(Wrapper());
    } else {
      Get.snackbar('Not verified yet', 'Please click the link in your email first');
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Email Verification'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(20),),
              child: const Icon(Icons.mark_email_unread_outlined,size: 44,color: Colors.white,),
            ),

            const SizedBox(height: 28),

            Text('Verify your email',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.black87,),
            ),

            const SizedBox(height: 12),

            Text('We\'ve sent a verification link to',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(fontSize: 17,color: Colors.grey[700],),
            ),

            const SizedBox(height: 4),

            Text(
              email,
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.black87,),
            ),

            const SizedBox(height: 8),

            Text('Open the email and tap the link, then come back here and continue.',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(fontSize: 15,color: Colors.grey[600],),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isChecking ? null : reload,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                ),
                child: _isChecking
                    ? const SizedBox( width: 22, height: 22,
                        child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                      )
                    : Text('I\'ve verified, continue',
                        style: GoogleFonts.cormorantGaramond(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: _isSending ? null : sendVerifyLink,
              child: Text(
                _isSending ? 'Sending...' : 'Resend link',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,fontWeight: FontWeight.w600,color: _isSending ? Colors.grey : Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}