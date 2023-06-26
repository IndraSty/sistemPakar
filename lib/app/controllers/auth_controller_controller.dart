import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/rule.dart';
import '../data/user_model.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserCredential? _userCredential;

  var user = UsersModel().obs;
  var rule = Rule().obs;
  var isAuth = false.obs;

  Stream<List<String>> getDataGejala() {
    final docRef = FirebaseFirestore.instance.collection('rule').doc('gejala');
    return docRef.snapshots().map((doc) {
      final gejala = doc.data()!['gejala'] as List<dynamic>;
      return gejala.cast<String>().toList();
    });
  }

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });
  }

  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => _userCredential = value);

        // simpan data user di firestore
        CollectionReference users = firestore.collection('user');
        final cekUser = await users.doc(_currentUser!.email).get();

        if (cekUser.data() == null) {
          await users.doc(_currentUser!.email).set({
            'uid': _userCredential!.user!.uid,
            'name': _currentUser!.displayName,
            'email': _currentUser!.email,
            'keyName': _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            'img': _currentUser!.photoUrl ?? "NoImage",
            'phone': _userCredential!.user!.phoneNumber,
            'create_at':
                _userCredential!.user!.metadata.creationTime!.toIso8601String(),
            'lastSignInTime': _userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            'update_at': DateTime.now().toIso8601String(),
          });
        } else {
          await users.doc(_currentUser!.email).update({
            'lastSignInTime': _userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        isAuth.value = true;
        
        Future.delayed(const Duration(seconds: 1), () {
          Get.back();
          Get.offAllNamed(Routes.HOME);
        });
        
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }


  Future<bool> autoLogin() async {
    try {
      final isSignin = await _googleSignIn.isSignedIn();
      if (isSignin) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => _userCredential = value);

        CollectionReference users = firestore.collection('users');
        await users.doc(_currentUser!.email).update({
          'lastSignInTime':
              _userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    isAuth.value = false;
    Get.offAllNamed(Routes.LOGIN);
  }
}
