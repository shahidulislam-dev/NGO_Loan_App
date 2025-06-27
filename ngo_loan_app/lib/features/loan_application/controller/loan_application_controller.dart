import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../presentation/screen/apply_for_loan.dart';
import '../presentation/screen/complete_kyc_screen.dart';

class LoanApplicationController extends GetxController {
  // Current step management
  var currentStep = 0.obs;
  var completedSteps = <bool>[false, false, false, false].obs;

  // Form keys
  final List<GlobalKey<FormState>> formKeys = List.generate(4, (_) => GlobalKey<FormState>());

  // Personal Information Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();
  final fatherHusbandNameController = TextEditingController();
  final surnameController = TextEditingController();
  final occupationFatherController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final alternatePhoneController = TextEditingController();
  final guardianNameController = TextEditingController();
  final guardianPhoneController = TextEditingController();
  final relationGuardianController = TextEditingController();
  final occupationController = TextEditingController();
  final monthlyIncomeController = TextEditingController();
  final familyMembersController = TextEditingController();
  final familyDetailsController = TextEditingController();

  // Identity Documents Controllers
  final nidNumberController = TextEditingController();
  final passportNumberController = TextEditingController();
  final bankAccountController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final bankNameController = TextEditingController();

  // Address Details Controllers
  final presentHouseController = TextEditingController();
  final presentThanaController = TextEditingController();
  final presentPostOfficeController = TextEditingController();
  final presentPostCodeController = TextEditingController();
  final presentDistrictController = TextEditingController();
  final permanentHouseController = TextEditingController();
  final permanentThanaController = TextEditingController();
  final permanentPostOfficeController = TextEditingController();
  final permanentPostCodeController = TextEditingController();
  final permanentDistrictController = TextEditingController();


  // Proof of Address Controllers
  final residentialAddressController = TextEditingController();

  var isSameAddressChecked = false.obs;

  // Function to copy address
  void toggleSameAddress(bool value) {
    isSameAddressChecked.value = value;

    if (value) {
      permanentHouseController.text = presentHouseController.text;
      permanentThanaController.text = presentThanaController.text;
      permanentPostOfficeController.text = presentPostOfficeController.text;
      permanentPostCodeController.text = presentPostCodeController.text;
      permanentDistrictController.text = presentDistrictController.text;
    } else {
      // Optionally clear permanent address fields
      permanentHouseController.clear();
      permanentThanaController.clear();
      permanentPostOfficeController.clear();
      permanentPostCodeController.clear();
      permanentDistrictController.clear();
    }
  }


  // Observable variables
  var selectedGender = Rxn<String>();
  var selectedDistrict = Rxn<String>();
  var selectedProofType = Rxn<String>();
  var sameAsPresentAddress = false.obs;
  var isLoading = false.obs;

  // Image files
  var nidFront = Rxn<File>();
  var nidBack = Rxn<File>();
  var passportFront = Rxn<File>();
  var passportBack = Rxn<File>();
  var passbook = Rxn<File>();
  var passportSizeImage = Rxn<File>();
  var addressProof = Rxn<File>();

  // Firebase instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  void nextStep() {
    if (formKeys[currentStep.value].currentState!.validate()) {
      completedSteps[currentStep.value] = true;
      if (currentStep.value < 3) {
        currentStep.value++;
      } else {
        // Submit loan application
        submitLoanApplication();
      }
    }
  }

  void goToStep(int step) {
    if (completedSteps[step]) {
      currentStep.value = step;
    }
  }

  void setGender(String? gender) {
    selectedGender.value = gender;
  }

  void setDistrict(String? district) {
    selectedDistrict.value = district;
  }

  void setProofType(String? proofType) {
    selectedProofType.value = proofType;
  }



  void setImage(String type, File? file) {
    switch (type) {
      case 'nidFront':
        nidFront.value = file;
        break;
      case 'nidBack':
        nidBack.value = file;
        break;
      case 'passportFront':
        passportFront.value = file;
        break;
      case 'passportBack':
        passportBack.value = file;
        break;
      case 'passbook':
        passbook.value = file;
        break;
      case 'passportPhoto':
        passportSizeImage.value = file;
        break;
      case 'addressProof':
        addressProof.value = file;
        break;
    }
  }

  Future<String?> uploadImage(File file, String path) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = await ref.putFile(file);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> submitLoanApplication() async {
    try {
      isLoading.value = true;

      // Generate unique application ID
      final applicationId = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload images to Firebase Storage
      Map<String, String?> imageUrls = {};

      if (nidFront.value != null) {
        imageUrls['nidFront'] = await uploadImage(nidFront.value!, 'loan_applications/$applicationId/nid_front.jpg');
      }
      if (nidBack.value != null) {
        imageUrls['nidBack'] = await uploadImage(nidBack.value!, 'loan_applications/$applicationId/nid_back.jpg');
      }
      if (passportFront.value != null) {
        imageUrls['passportFront'] = await uploadImage(passportFront.value!, 'loan_applications/$applicationId/passport_front.jpg');
      }
      if (passportBack.value != null) {
        imageUrls['passportBack'] = await uploadImage(passportBack.value!, 'loan_applications/$applicationId/passport_back.jpg');
      }
      if (passbook.value != null) {
        imageUrls['passbook'] = await uploadImage(passbook.value!, 'loan_applications/$applicationId/passbook.jpg');
      }
      if (passportSizeImage.value != null) {
        imageUrls['passportPhoto'] = await uploadImage(passportSizeImage.value!, 'loan_applications/$applicationId/passport_photo.jpg');
      }
      if (addressProof.value != null) {
        imageUrls['addressProof'] = await uploadImage(addressProof.value!, 'loan_applications/$applicationId/address_proof.jpg');
      }

      // Prepare loan application data
      final loanApplicationData = {
        'applicationId': applicationId,
        'applicationDate': FieldValue.serverTimestamp(),
        'status': 'pending',
        'personalInformation': {
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
          'gender': selectedGender.value,
          'dateOfBirth': dobController.text.trim(),
          'fatherHusbandName': fatherHusbandNameController.text.trim(),
          'surname': surnameController.text.trim(),
          'fatherHusbandOccupation': occupationFatherController.text.trim(),
          'email': emailController.text.trim(),
          'phoneNumber': phoneController.text.trim(),
          'alternatePhoneNumber': alternatePhoneController.text.trim(),
          'guardianName': guardianNameController.text.trim(),
          'guardianPhoneNumber': guardianPhoneController.text.trim(),
          'relationWithGuardian': relationGuardianController.text.trim(),
          'occupation': occupationController.text.trim(),
          'monthlyIncome': monthlyIncomeController.text.trim(),
          'familyMembers': familyMembersController.text.trim(),
          'familyDetails': familyDetailsController.text.trim(),
        },
        'identityDocuments': {
          'nidNumber': nidNumberController.text.trim(),
          'passportNumber': passportNumberController.text.trim(),
          'bankAccountNumber': bankAccountController.text.trim(),
          'ifscCode': ifscCodeController.text.trim(),
          'bankName': bankNameController.text.trim(),
          'nidFrontUrl': imageUrls['nidFront'],
          'nidBackUrl': imageUrls['nidBack'],
          'passportFrontUrl': imageUrls['passportFront'],
          'passportBackUrl': imageUrls['passportBack'],
          'passbookUrl': imageUrls['passbook'],
          'passportPhotoUrl': imageUrls['passportPhoto'],
        },
        'addressDetails': {
          'presentAddress': {
            'house': presentHouseController.text.trim(),
            'thana': presentThanaController.text.trim(),
            'postOffice': presentPostOfficeController.text.trim(),
            'postCode': presentPostCodeController.text.trim(),
            'district': presentDistrictController.text.trim(),
          },
          'permanentAddress': {
            'house': permanentHouseController.text.trim(),
            'thana': permanentThanaController.text.trim(),
            'postOffice': permanentPostOfficeController.text.trim(),
            'postCode': permanentPostCodeController.text.trim(),
            'district': permanentDistrictController.text.trim(),
          },
          'sameAsPresentAddress': sameAsPresentAddress.value,
        },
        'proofOfAddress': {
          'residentialAddress': residentialAddressController.text.trim(),
          'selectedDistrict': selectedDistrict.value,
          'proofType': selectedProofType.value,
          'addressProofUrl': imageUrls['addressProof'],
        },
      };

      // Save to Firestore
      await _firestore.collection('loan_application').doc(applicationId).set(loanApplicationData);

      // Show success message
      Get.snackbar(
        'Success',
        'Loan application submitted successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate to completion screen
      Get.offAll(() =>  ApplyForLoanScreen());

    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to submit loan application: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose all controllers
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    fatherHusbandNameController.dispose();
    surnameController.dispose();
    occupationFatherController.dispose();
    emailController.dispose();
    phoneController.dispose();
    alternatePhoneController.dispose();
    guardianNameController.dispose();
    guardianPhoneController.dispose();
    relationGuardianController.dispose();
    occupationController.dispose();
    monthlyIncomeController.dispose();
    familyMembersController.dispose();
    familyDetailsController.dispose();
    nidNumberController.dispose();
    passportNumberController.dispose();
    bankAccountController.dispose();
    ifscCodeController.dispose();
    bankNameController.dispose();
    presentHouseController.dispose();
    presentThanaController.dispose();
    presentPostOfficeController.dispose();
    presentPostCodeController.dispose();
    presentDistrictController.dispose();
    permanentHouseController.dispose();
    permanentThanaController.dispose();
    permanentPostOfficeController.dispose();
    permanentPostCodeController.dispose();
    permanentDistrictController.dispose();
    residentialAddressController.dispose();
    super.onClose();
  }
}
