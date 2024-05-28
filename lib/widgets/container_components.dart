import 'package:flutter/material.dart';
import 'package:widget_playground/model/container_component_model.dart';

class ContainerComponents extends StatefulWidget {
  const ContainerComponents({super.key, required this.componentModel});
  final ContainerComponentModel componentModel;

  @override
  State<ContainerComponents> createState() => _ContainerComponentsState();
}

class _ContainerComponentsState extends State<ContainerComponents> {
  late Offset position;
  late double height;
  late double width;
  late Color color;
  @override
  void initState() {
    super.initState();
    position = widget.componentModel.position;
    height = widget.componentModel.height;
    width = widget.componentModel.width;
    color = widget.componentModel.color;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: GestureDetector(
        onScaleUpdate: (details) {},
        child: Draggable(
            onDragUpdate: (DragUpdateDetails details) {
              setState(() {
                position += details.delta;
              });
            },
            feedback: Container(
              height: height,
              width: width,
              color: color,
            ),
            child: Container(
              height: height,
              width: width,
              color: color,
            )),
      ),
    );
  }
}
