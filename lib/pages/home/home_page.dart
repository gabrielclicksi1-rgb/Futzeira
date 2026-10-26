import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PopupMenuPages { container }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
            icon: Icon(Icons.restart_alt_outlined),
            tooltip: "selecione o tipo",
            onSelected: (PopupMenuPages valueSelected) {
              switch (valueSelected) {
                case PopupMenuPages.container:
                 Get.toNamed('/container');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<PopupMenuPages>>[
                PopupMenuItem(
                  value: PopupMenuPages.container,
                  child: Text('Container'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
