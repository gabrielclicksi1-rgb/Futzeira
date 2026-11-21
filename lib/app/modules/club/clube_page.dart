import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './clube_controller.dart';

class ClubePage extends GetView<ClubeController> {
    
    const ClubePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ClubePage'),),
            body: Container(),
        );
    }
}