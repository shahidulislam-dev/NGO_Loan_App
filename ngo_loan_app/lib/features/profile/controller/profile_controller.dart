import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngo_app/app_route.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var userData = {}.obs;

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;

      // Get current user UID
      final String? uid = _auth.currentUser?.uid;

      if (uid == null) {
        throw Exception("User not logged in");
      }

      // Fetch user document
      final DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        userData.value = userDoc.data() as Map<String, dynamic>;
      } else {
        throw Exception("User data not found in Firestore");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login'); // Or your route to login
  }

  void deleteUserAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final uid = user?.uid;

      // Optional: delete Firestore user data
      if (uid != null) {
        await FirebaseFirestore.instance.collection('users').doc(uid).delete();
      }

      // Delete account
      await user?.delete();
      Get.offAllNamed('/register'); // Or your landing screen
      Get.snackbar("Account Deleted", "Your account has been permanently deleted.");
    } catch (e) {
      Get.snackbar("Error", "❌ Failed to delete account.");
    }
  }


}
