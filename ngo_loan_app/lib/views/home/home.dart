import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/donate_screen/donate_screen.dart';
import 'package:ngo_app/views/home/home_screen.dart';
import 'package:ngo_app/views/profile_screen/profile_screen.dart';
import 'package:ngo_app/widgets_common/custom_text.dart'; // your CustomText

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0.obs;

  var navScreens = [
    const HomeScreen(),
    const ProfileScreen(),
    const DonateScreen(),
    const HomeScreen(),
  ];
  DateTime? lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          DateTime now = DateTime.now();
          if (lastBackPressTime == null ||
              now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
            lastBackPressTime = now;

            Fluttertoast.showToast(
              msg: "Press back again to exit",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          } else {
            SystemNavigator.pop(); // Exit the app
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
                  border: Border.all(color: darkGrey, width: 2),
                  image: const DecorationImage(
                    image: AssetImage(profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Gokul Kumari",
                    size: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    "Good Morning",
                    size: 13,
                    fontWeight: FontWeight.w600,
                    color: darkGrey,
                  ),
                ],
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, size: 40),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: Container(
          decoration: const BoxDecoration(
            gradient: gradientBackground,
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
                      const SizedBox(height: 40), // replaced 40.heightBox
                      const CustomText(
                        "NGO LOAN",
                        size: 40,
                        color: white,
                        fontWeight: FontWeight.w900,
                        fontFamily: bold,
                      ),
                      Column(
                        children: List.generate(
                          drawerStringList.length,
                              (index) {
                            return ListTile(
                              leading: Icon(
                                drawerIconList[index],
                                color: white,
                                size: 24,
                              ),
                              title: CustomText(
                                drawerStringList[index],
                                size: 20,
                                fontWeight: FontWeight.bold,
                                color: white,
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
                  child: Container(
                    height: 55,
                    width: 55, // to keep circle shape
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
              ],
            ),
          ),
        ),
        body: Obx(() => Column(
          children: [
            Expanded(child: navScreens.elementAt(selectedIndex.value)),
          ],
        )),
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
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: white,
                    iconSize: 24,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.purple,
                    color: darkGrey,
                    tabBorderRadius: 10.0,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      ),
                      GButton(
                        icon: Icons.card_giftcard,
                        text: 'Donation',
                      ),
                      GButton(
                        icon: Icons.pie_chart,
                        text: 'Charts',
                      ),
                    ],
                    selectedIndex: selectedIndex.value,
                    onTabChange: (index) {
                      selectedIndex.value = index;
                    },
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
