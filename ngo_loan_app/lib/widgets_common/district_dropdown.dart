import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/const/colors.dart';
import '../model/districts.dart';

class DistrictDropdown extends StatefulWidget {
  const DistrictDropdown({super.key});

  @override
  State<DistrictDropdown> createState() => _DistrictDropdownState();
}

class _DistrictDropdownState extends State<DistrictDropdown> {
  final districtsList = <String>[].obs;
  final dropValue = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  Future<void> getDistricts() async {
    var data = await rootBundle.loadString("lib/service/districts.json");
    var jsonData = districtsModelFromJson(data);
    var districtNames = jsonData.districts.map((e) => e.name).toList();
    districtsList.assignAll(districtNames);
  }

  @override
  void initState() {
    super.initState();
    getDistricts();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const Icon(Icons.location_on, color: AppColors.iconColor, size: 30),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text(
                    'Select a district',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  items: districtsList
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ))
                      .toList(),
                  value: dropValue.value.isNotEmpty ? dropValue.value : null,
                  onChanged: (value) {
                    setState(() {
                      dropValue.value = value!;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 16),
                    height: 50,
                    width: 200,
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    maxHeight: 250,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 8),
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          hintText: 'Search for a district...',
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                    },
                  ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
