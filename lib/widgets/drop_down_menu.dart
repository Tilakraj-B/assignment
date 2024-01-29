import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatefulWidget {
  final List<String> menuOptions;
  final String current;
  final Function(String) onChanged;
  const DropdownMenuWidget(
      {super.key,
      required this.menuOptions,
      required this.onChanged,
      required this.current});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.current;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: DropdownMenu<String>(
        initialSelection: widget.current,
        label: Text('Font Family'),
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.onChanged(dropdownValue);
        },
        dropdownMenuEntries:
            widget.menuOptions.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
