import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String labelText;
  final Color textColor;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({
    super.key,
    required this.labelText,
    this.textColor = Colors.white,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialValue;
  }

  void _toggleCheckbox() {
    setState(() {
      isSelected = !isSelected;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(isSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: _toggleCheckbox,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? null : Colors.white,
                gradient: isSelected
                    ? const LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              widget.labelText,
              textAlign: TextAlign.left,
              style: TextStyle(color: widget.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
