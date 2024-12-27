import 'package:flutter/material.dart';

class PageMixSizeFadeTransition extends PageRouteBuilder {
  final dynamic page;
  PageMixSizeFadeTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
            /// start from Align you determine the it
            alignment: Alignment.center,
            child: SizeTransition(
              sizeFactor: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
          ),
        );
}
