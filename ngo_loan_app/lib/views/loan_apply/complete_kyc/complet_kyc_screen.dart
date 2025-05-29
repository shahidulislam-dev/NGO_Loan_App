import 'package:flutter/material.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import '../../../const/colors.dart';
import 'personal_information.dart';
import 'identity_documents.dart';
import 'address_details.dart';
import 'proof_of_address.dart';

class CompleteKycScreen extends StatefulWidget {
  const CompleteKycScreen({super.key});

  @override
  _CompleteKycScreenState createState() => _CompleteKycScreenState();
}

class _CompleteKycScreenState extends State<CompleteKycScreen> {
  int _currentStep = 0;
  final List<bool> _completedSteps = [false, false, false, false];

  final _formKeys = List.generate(4, (_) => GlobalKey<FormState>());
  final _controllers = List.generate(4, (_) => TextEditingController());

  void _nextStep() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      setState(() {
        _completedSteps[_currentStep] = true;
        if (_currentStep < 3) {
          _currentStep++;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('KYC Completed!')),
          );
        }
      });
    }
  }

  Widget _buildStepIcons() {
    final icons = [
      Icons.person_2_outlined,
      Icons.featured_play_list_sharp,
      Icons.list_alt,
      Icons.credit_card_sharp,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: List.generate(icons.length * 2 - 1, (i) {
          if (i.isOdd) {
            int lineIndex = (i - 1) ~/ 2;
            bool isCompletedOrCurrent = (_completedSteps[lineIndex] || _currentStep > lineIndex);
            return Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  gradient: isCompletedOrCurrent ? gradientBackground : null,
                  color: isCompletedOrCurrent ? null : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          } else {
            int index = i ~/ 2;
            bool isCurrent = _currentStep == index;
            bool isCompleted = _completedSteps[index];
            double size = isCurrent ? 50 : 20;

            return GestureDetector(
              onTap: () {
                if (_completedSteps[index]) {
                  setState(() => _currentStep = index);
                }
              },
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: (isCurrent || isCompleted) ? gradientBackground : null,
                  color: (isCurrent || isCompleted) ? null : Colors.grey[300],
                  boxShadow: (isCurrent || isCompleted)
                      ? [const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))]
                      : null,
                ),
                child: Center(
                  child: isCurrent
                      ? Icon(icons[index], color: Colors.white, size: 30)
                      : isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : null,
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _buildStepTitle() {
    final titles = ["Personal Information", "Identity Documents", "Address Details", "Proof of Address"];
    return Padding(
      padding: const EdgeInsets.only(top:15, left: 20, right: 20),
      child: Text(
        titles[_currentStep],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: darkGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return PersonalInformation(
          controller: _controllers[0],
          formKey: _formKeys[0],
        );
      case 1:
        return IdentityDocuments(
          controller: _controllers[1],
          formKey: _formKeys[1],
        );
      case 2:
        return AddressDetails(
          controller: _controllers[2],
          formKey: _formKeys[2],
        );
      case 3:
        return ProofOfAddress(
          controller: _controllers[3],
          formKey: _formKeys[3],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.arrow_back_ios_new, size: 24),
              ),
            ),
            Expanded(child: _buildStepIcons()),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildStepTitle(), // Step title below AppBar
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _buildStepContent(),
                  const SizedBox(height: 20),
                  customButton(onPressed: _nextStep, text: _currentStep == 3 ? 'Submit' : 'Next'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}