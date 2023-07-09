import 'package:get/get.dart';

import '../../utils/diagnosis_cf/cf_diagnosis_view.dart';
import '../../utils/dialog/coba_coba.dart';
import '../../utils/dialog/coba_part_ii.dart';
import '../../utils/splash_screen.dart';
import '../modules/cf/bindings/cf_binding.dart';
import '../modules/cf/views/cf_view.dart';
import '../modules/daftar_penyakit/bindings/daftar_penyakit_binding.dart';
import '../modules/daftar_penyakit/views/daftar_penyakit_view.dart';
import '../modules/diagnosis/bindings/diagnosis_binding.dart';
import '../modules/diagnosis/views/diagnosis_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DIAGNOSIS,
      page: () => DiagnosisView(),
      binding: DiagnosisBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_PENYAKIT,
      page: () => const DaftarPenyakitView(),
      binding: DaftarPenyakitBinding(),
    ),
    GetPage(
      name: _Paths.Coba,
      page: () => const CobaCoba(),
    ),
    GetPage(
      name: _Paths.CobaII,
      page: () => const CobaPartII(),
    ),
    GetPage(
      name: _Paths.CF,
      page: () => const CFDiagnosisView(),
    ),
  ];
}
