import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/loan/presention/screens/education/help/education_help_screen.dart';

import 'package:ngo_app/features/loan/presention/screens/education/help/exam_score_eligibility.dart';
import 'package:ngo_app/features/loan/presention/screens/education/help/failed_eligibility_low_score.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

import '../../../../../../common/const/colors.dart';

class LoanExamScreen extends StatefulWidget {
  const LoanExamScreen({super.key});

  @override
  State<LoanExamScreen> createState() => _LoanExamScreenState();
}

class _LoanExamScreenState extends State<LoanExamScreen> {
  int currentIndex = 0;
  int correctAnswers = 0;
  List<int?> selectedAnswers = List.filled(5, null);
  List<bool> isCorrect = List.filled(5, false);

  final List<Question> questions = [
    Question('1. What is the interest rate of a micro loan?', ['5%', '10%', '15%', '20%'], 1),
    Question('2. Which document is essential for KYC?', ['PAN Card', 'Library Card', 'School ID', 'None'], 0),
    Question('3. Loan repayment duration is usually?', ['1 month', '6 months', '1 year', '5 years'], 2),
    Question('4. Which is a secured loan?', ['Home Loan', 'Personal Loan', 'Payday Loan', 'Credit Card Loan'], 0),
    Question('5. Which score affects loan approval?', ['Credit Score', 'Exam Score', 'Math Score', 'Voting Score'], 0),
  ];

  void updateAnswerStatus() {
    final selected = selectedAnswers[currentIndex];
    final correct = questions[currentIndex].correctIndex;

    if (selected != null) {
      if (selected == correct && !isCorrect[currentIndex]) {
        correctAnswers++;
        isCorrect[currentIndex] = true;
      } else if (selected != correct && isCorrect[currentIndex]) {
        correctAnswers--;
        isCorrect[currentIndex] = false;
      }
    }
  }

  void nextQuestion() {
    updateAnswerStatus();

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      double percent = correctAnswers / questions.length;
      if (percent >= 0.7) {
        Get.to(() => EducationHelpScreen(score: correctAnswers, total: questions.length));
      } else {
        Get.to(() =>  FailedEligibilityLowScore(score: correctAnswers.toInt(), total: questions.length.toInt()));
      }
    }
  }

  void previousQuestion() {
    setState(() {
      currentIndex = (currentIndex > 0) ? currentIndex - 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final percent = (correctAnswers / questions.length);
    final question = questions[currentIndex];
    final selected = selectedAnswers[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const CustomText("Exam", size: 24, fontWeight: FontWeight.w700, color:  AppColors.darkGrey),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: percent,
              minHeight: 13,
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF042773),
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 20),
            CustomText("${(percent * 100).toInt()}% Completed", size: 18, color:  AppColors.darkGrey),
            const SizedBox(height: 53),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                question.questionText,
                size: 18,
                fontWeight: FontWeight.w500,
                color:  AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              final isSelected = selected == index;
              final isAnswer = question.correctIndex == index;
              Color? tileColor;
              if (selected != null) {
                if (isAnswer) {
                  tileColor = Colors.green[100];
                } else if (isSelected && !isAnswer) {
                  tileColor = Colors.red[100];
                }
              }
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswers[currentIndex] = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF042773) : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          question.options[index],
                          size: 18,
                          color:  AppColors.darkGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: selected != null
                              ? (isAnswer ? Colors.green : isSelected ? Colors.red : Colors.white)
                              : Colors.white,
                          border: Border.all(
                            color: selected != null
                                ? (isAnswer ? Colors.green : isSelected ? Colors.red : Colors.grey)
                                : Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: selected != null && isSelected
                            ? Icon(
                          isAnswer ? Icons.check : Icons.close,
                          color: Colors.white,
                          size: 20,
                        )
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonTwo(
                  onPressed: previousQuestion,
                  text: "Preview",
                  gradient:  AppColors.gradientBackground,
                  textColor: Colors.white,
                  fontSize: 16,
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                ),
                CustomButtonTwo(
                  onPressed: nextQuestion,
                  text: currentIndex == questions.length - 1 ? "Finish" : "Continue",
                  gradient:  AppColors.gradientBackground,
                  textColor: Colors.white,
                  fontSize: 16,
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;

  Question(this.questionText, this.options, this.correctIndex);
}