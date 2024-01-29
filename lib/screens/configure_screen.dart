import 'package:assignment/widgets/color_picker_drop_down.dart';
import 'package:assignment/widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';

import '../assets/constants.dart';
import '../models/text_color.dart';
import '../models/text_object.dart';

class ConfigScreen extends StatefulWidget {
  List<TextObject> listTextObject;
  int index;
  final List<String> _fontFamily = [
    Roboto,
    SingleDay,
    Teko,
    PoorStory,
    GrapeNuts
  ];
  final List<TextColor> _textColor = [
    TextColor(label: 'Black', color: Colors.black),
    TextColor(label: 'White', color: Colors.white),
    TextColor(color: Colors.red, label: 'Red'),
    TextColor(color: Colors.blue, label: 'Blue'),
    TextColor(color: Colors.green, label: 'Green'),
    TextColor(color: Colors.orange, label: 'Orange'),
    TextColor(color: Colors.deepPurpleAccent, label: 'Purple'),
    TextColor(color: Colors.yellow, label: 'Yellow')
  ];
  ConfigScreen({super.key, required this.listTextObject, required this.index});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Configure",
        ),
        centerTitle: true,
      ),
      body: _buildBody(context, widget.listTextObject, widget.index),
    );
  }

  _buildBody(BuildContext context, List<TextObject> listTextObject, int index) {
    List<String> list = widget._fontFamily;
    String _currentFontFamily = widget.listTextObject[widget.index].fontFamily;
    TextColor _currentFontColor = widget.listTextObject[widget.index].textColor;
    double _currentFontSize = widget.listTextObject[widget.index].fontSize;
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.listTextObject[widget.index].text,
                style: TextStyle(
                    fontFamily: _currentFontFamily,
                    color: _currentFontColor.color,
                    fontSize: _currentFontSize),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownMenuWidget(
                  menuOptions: list,
                  onChanged: (value) {
                    setState(() {
                      _currentFontFamily = value;
                      widget.listTextObject[widget.index].fontFamily = value;
                    });
                  },
                  current: widget.listTextObject[widget.index].fontFamily),
              const SizedBox(
                height: 10,
              ),
              ColorDropDown(
                menuOptions: widget._textColor,
                onChanged: (textColor) {
                  setState(() {
                    _currentFontColor = textColor;
                    widget.listTextObject[widget.index].textColor =
                        _currentFontColor;
                  });
                },
                current: widget.listTextObject[widget.index].textColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.minimize),
                    onPressed: () {
                      setState(() {
                        if (_currentFontSize > 12) {
                          _currentFontSize -= 1;
                          widget.listTextObject[widget.index].fontSize =
                              _currentFontSize;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(widget.listTextObject[widget.index].fontSize
                        .toString()),
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (_currentFontSize < 30) {
                            _currentFontSize += 1;
                            widget.listTextObject[widget.index].fontSize =
                                _currentFontSize;
                          }
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
