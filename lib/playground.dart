import 'package:flutter/material.dart';
import 'package:widget_playground/model/container_component_model.dart';
import 'package:widget_playground/widgets/container_components.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  late List<ContainerComponentModel> playableWidget;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      final x = ((MediaQuery.sizeOf(context).width - 150) / 2);
      final y = ((MediaQuery.sizeOf(context).height - 150) / 2);
      final offset = Offset(x, y);
      if (mounted) {
        setState(() {
          playableWidget = [ContainerComponentModel(position: offset)];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final x = ((MediaQuery.sizeOf(context).width - 150) / 2);
          final y = ((MediaQuery.sizeOf(context).height - 150) / 2);
          final offset = Offset(x, y);
          setState(() {
            playableWidget = [
              ...playableWidget,
              ContainerComponentModel(position: offset)
            ];
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          // Image.network(
          //   'https://assets.weforum.org/article/image/0ZUBmNNVLRCfn3NdU55nQ00UF64m2ObtcDS0grx02fA.jpg',
          //   width: MediaQuery.sizeOf(context).width,
          //   height: MediaQuery.sizeOf(context).height,
          //   fit: BoxFit.cover,
          // ),
          ...List.generate(
            playableWidget.length,
            (index) =>
                ContainerComponents(componentModel: playableWidget[index]),
          )
        ],
      ),
    );
  }
}
