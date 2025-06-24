import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var selectedDistrict = ''.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> registerUser() async {
    if (!formKey.currentState!.validate() || selectedDistrict.isEmpty) {
      Get.snackbar("Error", "Please fill all fields including district");
      return;
    }

    try {
      isLoading(true);
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'full_name': fullNameController.text.trim(),
        'email': emailController.text.trim(),
        'district': selectedDistrict.value,
        'created_at': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "User registered successfully");
      Get.toNamed(AppRoute.login);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Registration failed");
    } finally {
      isLoading(false);
    }
  }
}
