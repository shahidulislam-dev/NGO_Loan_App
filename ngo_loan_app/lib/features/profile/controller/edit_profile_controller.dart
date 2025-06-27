import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/features/profile/controller/profile_controller.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final altPhoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final educationController = TextEditingController();
  final ProfileController controller = Get.find<ProfileController>();

  var maritalStatus = "Unmarried".obs;
  var selectedImage = Rxn<File>();
  var imageUrl = "".obs;
  var selectedDistrict = "".obs;

  final ImagePicker _picker = ImagePicker();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  /// 🔄 Load current user data
  Future<void> loadUserData() async {
    try {
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        nameController.text = data['full_name'] ?? "";
        dobController.text = data['dob'] ?? "";
        phoneController.text = data['phone'] ?? "";
        altPhoneController.text = data['alt_phone'] ?? "";
        emailController.text = data['email'] ?? "";
        addressController.text = data['address'] ?? "";
        educationController.text = data['education'] ?? "";
        maritalStatus.value = data['marital_status'] ?? "Unmarried";
        selectedDistrict.value = data['district'] ?? "";
        imageUrl.value = data['image'] ?? "";
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load user data");
    }
  }

  /// 📷 Pick image from gallery or camera
  Future<void> pickImage({required bool fromCamera}) async {
    final picked = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      selectedImage.value = file;
      await _uploadImageToFirebase(file);
    }
  }

  /// ☁️ Upload image to Firebase Storage
  Future<void> _uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = 'user_images/$uid/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl.value = downloadUrl;
      Get.snackbar('Success', '✅ Image uploaded');
    } catch (e) {
      Get.snackbar('Error', '❌ Image upload failed');
    }
  }

  /// ✏️ Update user profile
  Future<void> updateUserProfile() async {
    try {
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      Map<String, dynamic> previousData = snapshot.data() as Map<String, dynamic>;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'full_name': nameController.text.trim().isNotEmpty
            ? nameController.text.trim()
            : previousData['full_name'],
        'dob': dobController.text.trim().isNotEmpty
            ? dobController.text.trim()
            : previousData['dob'],
        'phone': phoneController.text.trim().isNotEmpty
            ? phoneController.text.trim()
            : previousData['phone'],
        'alt_phone': altPhoneController.text.trim().isNotEmpty
            ? altPhoneController.text.trim()
            : previousData['alt_phone'],
        'email': emailController.text.trim().isNotEmpty
            ? emailController.text.trim()
            : previousData['email'],
        'address': addressController.text.trim().isNotEmpty
            ? addressController.text.trim()
            : previousData['address'],
        'education': educationController.text.trim().isNotEmpty
            ? educationController.text.trim()
            : previousData['education'],
        'district': selectedDistrict.value.isNotEmpty
            ? selectedDistrict.value
            : previousData['district'],
        'marital_status': maritalStatus.value,
        'image': imageUrl.value.isNotEmpty ? imageUrl.value : previousData['image'],
      });
      controller.fetchUserData();

      Get.snackbar('Success', '✅ Profile updated');
    } catch (e) {
      Get.snackbar('Error', '❌ Failed to update profile');
    }
  }
}
