
import 'package:get/get.dart';

class NavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  DateTime? lastBackPressTime;

  void updateTab(int index) {
    selectedIndex.value = index;
  }

  bool shouldExitApp() {
    DateTime now = DateTime.now();
    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
      lastBackPressTime = now;
      return false;
    } else {
      return true;
    }
  }
}
