import 'package:flutter/material.dart';
import 'package:futzera_app/app/routes/auth_routers.dart';
import 'package:futzera_app/app/routes/splash_routers.dart';
import 'package:get/get.dart';
import 'package:futzera_app/app/core/ui/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.dark,
      getPages: [
        ...SplashRouters.routes,
        ...AuthRouters.routes,
        
      ],
   );
  }
}
