import 'package:assignment/screens/configure_screen.dart';
import 'package:assignment/viewModels/home_viewModel.dart';
import 'package:assignment/widgets/text_object_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> stack = [];
    return ChangeNotifierProvider(
      create: (context) =>
          HomePageViewModel(screenHeight: height, screenWidth: width),
      child: Consumer<HomePageViewModel>(
        builder: (context, viewModel, __) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children:
                        List.generate(viewModel.listTextObject.length, (index) {
                      Offset dragDetails =
                          viewModel.listTextObject[index].position;
                      return Positioned(
                        left: dragDetails.dx,
                        top: dragDetails.dy,
                        child: Draggable(
                          feedback: TextObjectWidget(
                            textObject: viewModel.listTextObject[index],
                            onChanged: (value) {
                              viewModel.listTextObject[index].text = value;
                            },
                            onPressed: () {},
                          ),
                          onDragEnd: (details) {
                            setState(() {
                              dragDetails = details.offset;
                            });
                            viewModel.listTextObject[index].position =
                                dragDetails;
                          },
                          child: TextObjectWidget(
                            textObject: viewModel.listTextObject[index],
                            onChanged: (value) {
                              viewModel.listTextObject[index].text = value;
                            },
                            onPressed: () async {
                              var value = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfigScreen(
                                            listTextObject:
                                                viewModel.listTextObject,
                                            index: index,
                                          )));
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                    child: FilledButton(
                  child: Text("Add Field"),
                  onPressed: () {
                    setState(() {
                      viewModel.addTextObject(
                          screenWidth: width, screenHeight: height);
                    });
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
