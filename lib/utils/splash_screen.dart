import 'package:flutter/material.dart';

import '../constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: Constant.gradientBox),
          child: Center(
            child: Image.asset('assets/images/splashLogo.png'),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
