
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final athleteIdController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordObscured = true.obs;
  final rememberAccess = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordObscured.toggle();
  }

  void toggleRememberAccess(bool? value) {
    rememberAccess.value = value ?? false;
  }

  Future<void> submit() async {
    if (isLoading.value || !(formKey.currentState?.validate() ?? false)) return;

    // Interface pronta para ser ligada ao serviço de autenticação do projeto.
    isLoading.value = true;
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;
  }

  void showIntegrationMessage(String action) {
    Get.snackbar(
      action,
      'Esta ação poderá ser conectada ao fluxo de autenticação do app.',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(AppSpacing.md),
      backgroundColor: LoginColors.surfaceHigh,
      colorText: LoginColors.text,
      borderRadius: AppRadius.sm,
    );
  }

  @override
  void onClose() {
    athleteIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}