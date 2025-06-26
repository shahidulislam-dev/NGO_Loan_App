import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/common/const/const.dart';

class EditProfileController{
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final altPhoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final educationController = TextEditingController();

  var maritalStatus = "Unmarried".obs;
  var selectedImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      selectedImage.value = file;
      await _uploadImageToFirebase(file);
    }
  }
  Future<void> _uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = 'ngo_app/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();
      Get.snackbar('Success','Uploaded Successfully');

    } catch (e) {
      Get.snackbar('Error','❌ Upload failed');
    }
  }


}