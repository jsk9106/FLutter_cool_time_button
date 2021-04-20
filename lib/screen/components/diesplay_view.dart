import 'package:flutter/material.dart';
import 'package:flutter_cool_time/controller/button_controller.dart';
import 'package:get/get.dart';

import '../app.dart';

class DisplayView extends GetView<ButtonController> {
  DisplayView();

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Widget view = Container();
      switch(controller.actionButton.value) {
        case ButtonType.IDLE:
          view = Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/idle.gif'),
          );
          break;
        case ButtonType.SKILL1:
          view = Container(
            width: 300,
            height: 300,
            child: Image.asset('assets/skill1.gif'),
          );
          break;
        case ButtonType.SKILL2:
          view = Container(
            width: 300,
            height: 300,
            child: Image.asset('assets/skill2.gif'),
          );
          break;
      }
      return Container(
        child: view
      );
    });
  }
}
