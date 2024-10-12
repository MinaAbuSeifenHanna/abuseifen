import 'dart:ui';
import 'package:flutter/material.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
           // Color(0xFF2B1F76),
            Colors.black,
            Color(0xFF2B1F76), // اللون الأرجواني الداكن
          ],
        ),
      ),
      child: Stack(
        children: [
          // الطبقة الأولى - الصورة الأولى
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpeg', // ضع المسار الصحيح للصورة الأولى
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
               color: Colors.black.withOpacity(0.10), // خفف الصورة الأولى
               colorBlendMode: BlendMode.lighten,
            ),
          ),
          // الطبقة الثانية - الصورة الثانية
          Positioned.fill(
            child: Image.asset(
              'assets/images/hypelify_BG.jpeg', // ضع المسار الصحيح للصورة الثانية
              fit: BoxFit.fill,

              filterQuality: FilterQuality.low,
              color: Colors.white.withOpacity(0.2), // خفف الصورة الثانية
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // التمويه والشفافية النهائية
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.10, sigmaY: 0.5), // تمويه خفيف جداً
            child: Container(
              color: Colors.black.withOpacity(0.6), // شفافية خفيفة لتعديل الألوان
            ),
          ),
        ],
      ),
    );
  }
}
