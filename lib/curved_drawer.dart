library curved_drawer;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:curved_close_drawer/clipper.dart';

/// A Calculator.
class CurvedDrawer extends StatefulWidget {
  /// Drawer width
  final double width;

  /// Drawer Color
  final Color color;

  /// Drawer child
  final Widget child;


  CurvedDrawer({this.width = 300, this.color = Colors.blue, this.child});

  @override
  _CurvedDrawerState createState() => _CurvedDrawerState();
}

class _CurvedDrawerState extends State<CurvedDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    controller.addListener(() {
      if (controller.isCompleted)
        Navigator.pop(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return builderDrawerWidget();
  }

  Widget builderDrawerWidget() {
    Size size = MediaQuery
        .of(context)
        .size;
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(width: size.width, height: size.height, color:
        Colors.transparent,),
        ClipPath(
          clipper: Clipper(),
          child: Container(
            color: Colors.blue,
            width: widget.width,
            child: widget.child,
          ),
        ),
        Positioned(
          left: widget.width - 20.0,
          top: 100,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(40)),
            child: InkWell(
              onTap: () {
                controller.forward();
                Future.delayed(
                    Duration(seconds: 1), () => controller.reverse());
              },
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, animationValue) {
                    return Transform.rotate(
                      angle: -math.pi * (1 + (1 * controller.value)),
                      child: Icon(
                        Icons.close,
                        color: Colors.blue,
                      ),
                    );
                  }
              ),
            ),
          ),
        ),
      ],
    );
  }
}

