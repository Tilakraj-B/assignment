import 'package:flutter/material.dart';

import '../models/text_color.dart';

class ColorDropDown extends StatefulWidget {
  final List<TextColor> menuOptions;
  final TextColor current;
  final Function(TextColor) onChanged;
  const ColorDropDown(
      {super.key,
      required this.menuOptions,
      required this.onChanged,
      required this.current});

  @override
  State<ColorDropDown> createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ColorDropDown> {
  @override
  Widget build(BuildContext context) {
    TextColor dropdownValue = widget.current;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: DropdownMenu<TextColor>(
        initialSelection: widget.current,
        label: Text('Text Color'),
        hintText: 'Text Color',
        onSelected: (TextColor? value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.onChanged(dropdownValue);
        },
        dropdownMenuEntries: widget.menuOptions
            .map<DropdownMenuEntry<TextColor>>((TextColor value) {
          return DropdownMenuEntry<TextColor>(
              value: value,
              label: value.label,
              leadingIcon: Icon(
                Icons.square,
                color: value.color,
              ));
        }).toList(),
      ),
    );
  }
}
