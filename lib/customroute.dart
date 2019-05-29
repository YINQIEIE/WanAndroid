import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder<Widget> {
  CustomRoute(this.widget)
      : super(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              widget,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(
                      CurvedAnimation(parent: animation, curve: Curves.easeIn)),
              child: child,
            );
          },
        );
  final Widget widget;
}

class SplashRoute extends PageRouteBuilder<Widget> {
  SplashRoute(this.widget)
      : super(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              widget,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeIn)),
              child: child,
            );
          },
        );
  final Widget widget;
}
