import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.cormorantGaramond(fontSize: 18,fontWeight: FontWeight.w500,),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.cormorantGaramond(
          color: Colors.grey[400],
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
        errorStyle: GoogleFonts.cormorantGaramond(fontSize: 13,color: Colors.red[700]),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.red[700]!),),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.red[700]!),),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black87),
        ),
        suffixIcon: suffixIcon ?? Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8),),
              child: Icon(icon,color: Colors.white,size: 20,),
            ),
      ),
    );
  }
}
