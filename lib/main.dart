import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/view/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'QR Scanner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'HT Rakik',
            primaryColor: Colors.deepPurple,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
            useMaterial3: true),
        home: const Splash());
  }
}
