import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../loan_history/loan_history_screen.dart';

class LoanController extends GetxController {
  var isLoading = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var userApplications = [].obs;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final existingLoan = "No".obs;

  Future<void> applyForLoan() async {
    isLoading.value = true;

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("No user logged in");
      }

      final data = {
        "uid": currentUser.uid,
        "email": currentUser.email,
        "amount": amountController.text.trim(),
        "reason": reasonController.text.trim(),
        "hasExistingLoan": existingLoan.value,
        "status": "pending",
        "timestamp": FieldValue.serverTimestamp(),
      };

      await firestore.collection("applications").add(data);

      Get.snackbar("Success", "Loan application submitted successfully!",
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      log("Loan apply error: $e");
      Get.snackbar("Error", "Failed to apply for loan",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserApplications(String uid) async {
    try {
      final snapshot = await firestore
          .collection("applications")
          .where("uid", isEqualTo: uid)
         // .orderBy("timestamp", descending: true)
          .get();

      userApplications.value = snapshot.docs.map((doc) => doc.data()).toList();

      // Log each application's full data
      for (var doc in snapshot.docs) {
        log("Fetched Application ID: ${doc.id}");
        log("Application Data: ${doc.data()}");
      }

      Get.to(()=> LoanHistoryScreen());
    } catch (e) {
      log("Fetching applications failed: $e");
    }
  }

}
