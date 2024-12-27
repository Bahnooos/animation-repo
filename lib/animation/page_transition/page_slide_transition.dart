import 'package:flutter/material.dart';

class PageSlideTransition extends PageRouteBuilder {
  final dynamic page;
  PageSlideTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
            alignment: Alignment.center,

            ///  ( 0 , 1 )     bottom to top
            ///  ( 0 , -1 )    top to bottom
            ///  ( 1 , 1 )     bottom Right to  top Left
            ///  ( -1 , -1 )   top Left to  bottom Righ
            ///  ( 1 , 0 )     Right to  Left
            ///  ( -1 , 0 )    Left  to   Righ
            ///  ( -1 , 1 )   bottom Left to  top Right
            ///  ( 1 , -1 )   top Right to  bottom Left
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, -1), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.linear),
              ),
              child: child,
            ),
          ),
        );
}
