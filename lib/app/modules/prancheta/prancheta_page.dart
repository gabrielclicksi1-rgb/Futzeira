import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './prancheta_controller.dart';

class PranchetaPage extends GetView<PranchetaController> {
    
    const PranchetaPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('PranchetaPage'),),
            body: Container(),
        );
    }
}