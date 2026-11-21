import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './partidas_controller.dart';

class PartidasPage extends GetView<PartidasController> {
    
    const PartidasPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('PartidasPage'),),
            body: Container(),
        );
    }
}