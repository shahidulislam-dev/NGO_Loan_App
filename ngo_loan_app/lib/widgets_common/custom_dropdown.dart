import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/const/colors.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 18,
                  color: darkGrey,
                ),
              ),
            ),
          ))
              .toList(),
          value: widget.value,
          onChanged: widget.onChanged,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 16),
            height: 50,
            width: double.infinity,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}