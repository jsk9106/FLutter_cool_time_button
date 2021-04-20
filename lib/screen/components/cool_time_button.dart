import 'package:flutter/material.dart';
import 'package:flutter_cool_time/controller/button_controller.dart';

import 'progress_animate_container.dart';

class CoolTimeButton extends StatefulWidget {
  final ButtonType type;
  final int coolTime;
  final int skillAnimationTime;
  final Size buttonSize;

  const CoolTimeButton({
    Key? key,
    required this.type,
    required this.coolTime,
    required this.skillAnimationTime,
    required this.buttonSize,
  }) : super(key: key);

  @override
  _CoolTimeButtonState createState() => _CoolTimeButtonState();
}

class _CoolTimeButtonState extends State<CoolTimeButton>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  double _progress = 0.0;
  bool isActive = true;
  String skillName = '';

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: widget.coolTime), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: animationController!, curve: Curves.linear))
      ..addListener(() {
        setState(() {
          _progress = animation!.value;
          if (animation!.isCompleted) {
            _changeState(true);
          }
        });
      });

    _setSkillName();
    super.initState();
  }

  void _setSkillName(){
    switch(widget.type){
      case ButtonType.IDLE:
        break;
      case ButtonType.SKILL1:
        skillName = 'skill1';
        break;
      case ButtonType.SKILL2:
        skillName = 'skill2';
        break;
    }
  }

  void _changeState(bool state) {
    setState(() {
      isActive = state;
    });
  }

  void _actionButton() {
    if (isActive) {
      _changeState(false);
      animationController!.forward(from: 0);
      ButtonController.to.action(widget.type);
      Future.delayed(Duration(milliseconds: widget.skillAnimationTime), (){
        ButtonController.to.actionButton(ButtonType.IDLE);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _actionButton(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ProgressAnimateContainer(
          height: widget.buttonSize.width,
          width: widget.buttonSize.height,
          child: Image.asset('assets/$skillName.jpg', fit: BoxFit.fitWidth),
          progress: this._progress,
        ),
      ),
    );
  }
}
