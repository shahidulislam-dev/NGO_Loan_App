import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/common/const/colors.dart';

class DonationController extends GetxController{
  var isLoading = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();

  Future<void> createDonation() async {
    isLoading.value = true;

    // Show loading dialog
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: AppColors.purpleColor,
        ),
      ),
      barrierDismissible: false,
    );

    try {
      // Get the current logged-in user
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception("No user is currently logged in.");
      }

      // Create a donation map
      final donationData = {
        "uid": currentUser.uid,

        "amount": amountController.text.trim(),
        "mobile": mobileController.text.trim(),
        "accountNumber": accountNumberController.text.trim(),
        "code": codeController.text.trim(),
        "bankName": bankNameController.text.trim(),
        "timestamp": FieldValue.serverTimestamp(),
      };

      // Save to Firestore under a new document
      await firebaseFirestore.collection('donation').add(donationData);

      // Show success message
      Get.back(); // Close dialog
      Get.snackbar(
        "Success",
        "Donation submitted successfully!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Clear input fields
      amountController.clear();
      mobileController.clear();
      accountNumberController.clear();
      codeController.clear();
      bankNameController.clear();
    } catch (e) {
      log("The exception is ${e.toString()}");

      Get.back(); // Close dialog if open
      Get.snackbar(
        "Error",
        "Failed to submit donation. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

}