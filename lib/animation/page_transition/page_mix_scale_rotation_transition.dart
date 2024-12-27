import 'package:flutter/material.dart';

class PageMixScaleRotationTransition extends PageRouteBuilder {
  final dynamic page;
  PageMixScaleRotationTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: RotationTransition(turns:Tween<double>(begin: 0, end: 2).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ) , child: child),
            ),
          ),
        );
}
