import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngo_app/app_route.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var userData = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
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

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      // After logout, navigate to login or welcome screen
      Get.offAllNamed(AppRoute.login); // Replace with your login route name
    } catch (e) {
      Get.snackbar("Logout Failed", e.toString());
    }
  }

}
