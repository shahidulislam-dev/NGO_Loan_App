
import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CustomText(
          "Dashboard",
          size: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.appPurpleColor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Greeting or User Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppColors.gradientBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.grey)],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("Welcome Back,", size: 16, color: Colors.white),
                      CustomText("Shahidul Islam", size: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions
            Row(
              children: [
                Expanded(
                  child: homeCard(
                    icon: loanIcon1,
                    title: "Loan Status",
                    status: "Check Now",
                    onTap: () {

                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: homeCard(
                    icon: loanIcon2,
                    title: "Donate",
                    status: "Support Now",
                    onTap: () {
                      // Navigate to DonateScreen
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: homeCard(
                    icon: loanIcon3,
                    title: "Loan Profile",
                    status: "Update",
                    onTap: () {
                      // Navigate to EditProfileScreen
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: homeCard(
                    icon: loanIcon4,
                    title: "Loan History",
                    status: "View",
                    onTap: () {
                      // Navigate to LoanHistoryScreen
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Highlight Banner or Motivation Text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 165, 0, 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const CustomText(
                "“Empowering your dreams through easy and accessible loans.”",
                size: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget homeCard({
  required String icon,
  required String title,
  required String status,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 40),
          const SizedBox(height: 8),
          CustomText(title, size: 16, fontWeight: FontWeight.bold),
          CustomText(status, size: 12, color: Colors.grey),
        ],
      ),
    ),
  );
}