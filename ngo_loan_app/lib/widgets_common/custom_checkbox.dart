import 'package:ngo_app/const/const.dart';

class CustomCheckbox extends StatefulWidget {
  final String labelText;
  final Color textColor;

  const CustomCheckbox({
    super.key,
    required this.labelText,
    this.textColor = Colors.white,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
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
            child: Center(
              child: Checkbox(
                side: const BorderSide(color: Colors.transparent),
                activeColor: Colors.transparent,
                checkColor: Colors.white,
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value!;
                  });
                },
              ),
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
