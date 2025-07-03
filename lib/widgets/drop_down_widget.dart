import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.listName,
    this.onChanged,
  });

  final List<String> items;
  final String listName;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
      child: DropdownFlutter<String>(
        decoration: CustomDropdownDecoration(
          closedBorderRadius: BorderRadius.circular(12),
          expandedBorderRadius: BorderRadius.circular(12),
          hintStyle: const TextStyle(
            color: Color(0xff4C4C4C),
          ),
          closedBorder: Border.all(
            color: const Color(0xff4C4C4C),
          ),
        ),
        hintText: listName,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
