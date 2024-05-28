import 'package:flutter/material.dart';
import 'package:widget_playground/constants/constants.dart';

class ContainerComponentModel {
  final double height;
  final double width;
  final Color color;
  final Offset position;
  ContainerComponentModel(
      {this.height = constantContainerSize,
      this.width = constantContainerSize,
      this.color = constantContainerColor,
      required this.position});
}
