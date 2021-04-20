import 'package:flutter/material.dart';
import 'package:flutter_cool_time/controller/button_controller.dart';

import 'components/cool_time_button.dart';
import 'components/diesplay_view.dart';

ButtonController buttonController = ButtonController();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DisplayView(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoolTimeButton(
                  buttonSize: Size(70, 70),
                  coolTime: 5,
                  skillAnimationTime: 800,
                  type: ButtonType.SKILL1,
                ),
                SizedBox(width: 10),
                CoolTimeButton(
                  buttonSize: Size(70, 70),
                  coolTime: 10,
                  skillAnimationTime: 2800,
                  type: ButtonType.SKILL2,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
