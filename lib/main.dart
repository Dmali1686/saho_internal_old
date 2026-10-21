import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const SawoApp());
}

class SawoApp extends StatelessWidget {
  const SawoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'SAWO Management System',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}
