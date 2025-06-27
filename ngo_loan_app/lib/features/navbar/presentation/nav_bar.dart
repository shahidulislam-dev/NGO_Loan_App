import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ngo_app/features/profile/controller/profile_controller.dart';


import 'package:ngo_app/features/loan_history/loan_history_screen.dart';

import 'package:ngo_app/widgets_common/custom_text.dart';


import '../../../common/const/colors.dart';
import '../../../common/const/images.dart';
import '../../../common/const/lists.dart';
import '../../../common/const/styles.dart';
import '../../donate/presentation/screen/donation_screen.dart';
import '../../home/presentation/screen/home_screen.dart';
import '../../profile/presentation/screen/profile_screen.dart';
import '../controller/nav_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  static const String routeName = "/navBar";

  final NavController controller = Get.put(NavController());
  final ProfileController profileController = Get.find<ProfileController>();

  final List<Widget> navScreens =  [
    HomeScreen(),
     ProfileScreen(),
      DonateScreen(),
     LoanHistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (controller.shouldExitApp()) {
            SystemNavigator.pop();
          } else {
            Fluttertoast.showToast(
              msg: "Press back again to exit",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkGrey, width: 2),
                ),
                child: Obx(()=>
                   ClipOval(
                    child: profileController.userData['image'] != null
                        ? Image.network(
                      profileController.userData['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(profileImage, fit: BoxFit.cover);
                      },
                    )
                        : Image.asset(profileImage, fit: BoxFit.cover),
                  ),
                ),
              ),

              const SizedBox(width: 10),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(()=> CustomText(
                      "${profileController.userData['full_name']??''}",
                      size: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomText(
                    "Good Morning",
                    size: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGrey,
                  ),
                ],
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, size: 40),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.gradientBackground,
          ),
          child: Drawer(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 40),
                      const CustomText(
                        "NGO LOAN",
                        size: 40,
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppTextStyle.bold,
                      ),
                      Column(
                        children: List.generate(
                          drawerStringList.length,
                              (index) {
                            return ListTile(
                              leading: Icon(
                                drawerIconList[index],
                                color: AppColors.white,
                                size: 24,
                              ),
                              title: CustomText(
                                drawerStringList[index],
                                size: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: (){
                      profileController.logoutUser();
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          powerIcon,
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Obx(() => navScreens[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
              () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: AppColors.white,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.purple,
                    color: AppColors.darkGrey,
                    tabBorderRadius: 10.0,
                    tabs: const [
                      GButton(icon: Icons.home, text: 'Home'),
                      GButton(icon: Icons.person, text: 'Profile'),
                      GButton(icon: Icons.card_giftcard, text: 'Donation'),
                      GButton(icon: Icons.pie_chart, text: 'History'),
                    ],
                    selectedIndex: controller.selectedIndex.value,
                    onTabChange: controller.updateTab,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



