import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../common/const/colors.dart';
import '../features/authentication/controller/sign_up_controller.dart';
import '../model/districts.dart';
class DistrictDropdown extends StatelessWidget {
  DistrictDropdown({super.key});
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _loadDistricts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final districts = snapshot.data!;
        return Obx(() {
          return Container(
            padding: const EdgeInsets.only(left: 2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on,
                    color: AppColors.iconColor, size: 30),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text(
                        'Select a district',
                        style: TextStyle(fontSize: 18, color: AppColors.darkGrey),
                      ),
                      items: districts
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(fontSize: 18)),
                      ))
                          .toList(),
                      value: controller.selectedDistrict.value.isEmpty
                          ? null
                          : controller.selectedDistrict.value,
                      onChanged: (value) {
                        controller.selectedDistrict.value = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<List<String>> _loadDistricts() async {
    var data = await rootBundle.loadString("lib/service/districts.json");
    var jsonData = districtsModelFromJson(data);
    return jsonData.districts.map((e) => e.name).toList();
  }
}
