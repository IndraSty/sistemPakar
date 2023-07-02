import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sistempakar/utils/error_screen.dart';
import 'package:sistempakar/utils/loading_screen.dart';
import 'package:sistempakar/utils/splash_screen.dart';

import 'app/controllers/auth_controller_controller.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Ubah warna status bar
    ));
    
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final authCtrl = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'SistemPakar',
    //   initialRoute: Routes.CobaII,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx(
                  () => GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'SistemPakar',
                    theme: ThemeData(
                    ),
                    initialRoute:
                        authCtrl.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
                    getPages: AppPages.routes,
                  ),
                );
              }
              return FutureBuilder(
                future: authCtrl.firstInitialized(),
                builder: (context, snapshot) => const SplashScreen(),
              );
            },
          );
        }
        return const LoadingPage();
      },
    );
  }
}
