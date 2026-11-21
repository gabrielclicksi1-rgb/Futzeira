import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './torneio_controller.dart';

class TorneioPage extends GetView<TorneioController> {
    
    const TorneioPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('TorneioPage'),),
            body: Container(),
        );
    }
}