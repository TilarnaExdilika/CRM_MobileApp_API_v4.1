import 'package:flutter/material.dart';

class DynamicInputCard extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const DynamicInputCard({
    Key? key,
    required this.label,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    Color labelColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: labelColor),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          controller: controller,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
