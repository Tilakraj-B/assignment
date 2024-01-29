import 'package:flutter/material.dart';

import '../models/text_object.dart';

class TextObjectWidget extends StatefulWidget {
  final TextObject textObject;
  final Function(String) onChanged;
  final Function() onPressed;
  const TextObjectWidget(
      {super.key,
      required this.textObject,
      required this.onChanged,
      required this.onPressed});

  @override
  State<TextObjectWidget> createState() => _TextObjectWidgetState();
}

class _TextObjectWidgetState extends State<TextObjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: TextFormField(
                initialValue: widget.textObject.text,
                onChanged: widget.onChanged,
                style: TextStyle(
                    fontFamily: widget.textObject.fontFamily,
                    color: widget.textObject.textColor.color,
                    fontSize: widget.textObject.fontSize),
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                  icon: Icon(Icons.brush_rounded), onPressed: widget.onPressed),
            )
          ],
        ),
      ),
    );
  }
}
