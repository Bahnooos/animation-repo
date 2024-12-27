import 'package:flutter/material.dart';

class PageSizeTransition extends PageRouteBuilder {
  final dynamic page;
  PageSizeTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
            /// start from Align you determine the it
            alignment: Alignment.center,
            child: SizeTransition(sizeFactor: animation, child: child,),
          ),
        );
}
