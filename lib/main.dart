import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/button_controller.dart';
import 'screen/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(ButtonController());
      }),
      home: App(),
    );
  }
}


