import 'package:flutter/material.dart';

class PageRotationTransition extends PageRouteBuilder {
  final dynamic page;
  PageRotationTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: Tween<double>(begin: .5, end: 1).animate(CurvedAnimation(parent: animation, curve: Curves.linear),),
              child: child,
            ),
          ),
        );
}
