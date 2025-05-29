import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/model/districts.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

Widget districtDropdown() {
  var districtsList = <String>[].obs;
  var dropValue = ''.obs;

  // Load districts from JSON file
  Future<void> getDistricts() async {
    var data = await rootBundle.loadString("lib/models/districts.json");
    var jsonData = districtsModelFromJson(data);
    var districtNames = jsonData.districts.map((e) => e.name).toList();
    districtsList.assignAll(districtNames);
  }

  // Call getDistricts to populate the list
  getDistricts();

  return Obx(() {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: iconColor, size: 40),
          Expanded(
            child: CustomDropdown(
              hintText: 'Select a district',
              items: districtsList.toList(),
              onChanged: (value) {
                dropValue.value = value!;
              },
            ),
          ),
        ],
      ),
    );
  });
}
