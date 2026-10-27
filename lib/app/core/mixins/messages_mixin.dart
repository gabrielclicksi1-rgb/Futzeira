

import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
          colorText: model.type.textColor(),
          margin: const EdgeInsets.all(20),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return AppColors.arcadeRed;
      case MessageType.info:
        return AppColors.cyan;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageType.error:
        return AppColors.foreground;
      case MessageType.info:
        return AppColors.inverseOnSurface;
    }
  }
}
