import 'dart:math';
import 'package:flutter/material.dart';

class LoaderSpinnes extends StatefulWidget {
  @override
  _LoaderSpinnesState createState() => _LoaderSpinnesState();
}

class _LoaderSpinnesState extends State<LoaderSpinnes>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  double rote= 0;
  bool forward = true;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_rotation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.easeInOutQuad)));

    controller.addListener(() {
      setState(() {
        if (forward) {
          if (animation_radius_in.value != 0) {
            radius = animation_radius_in.value * initialradius;
          } else {
            radius = animation_radius_in.value * -initialradius;
          }
          if (animation_radius_in.value <= 0.2) {
            forward = false;
          }
        } else {
          if (animation_radius_in.value != 0) {
            radius = -animation_radius_in.value * initialradius;
          } else {
            radius = -animation_radius_in.value * initialradius;
          }
          if (animation_radius_in.value <= 0.2) {
            forward = true;
          }
        }
        rote ++;
        if(rote >= 360){
          rote = 0;
        }
      });
    });

    controller.repeat();
  }

  final double initialradius = 30;
  double radius = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: Transform.rotate(
          angle: rote,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30,
                color: Colors.black12,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.black,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.blue,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.brown,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.greenAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.pinkAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
