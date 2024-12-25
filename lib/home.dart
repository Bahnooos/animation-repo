import 'package:animation/animation/implicit_animation.dart/animated_align_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_container_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_cross_fade_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_list_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_opacity_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_padding_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_physical_model_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_position_example.dart';
import 'package:animation/animation/implicit_animation.dart/animated_switcher_example.dart';
import 'package:animation/animation/implicit_animation.dart/animation_position_directional_example.dart';
import 'package:animation/animation/implicit_animation.dart/animation_text_style_example.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String homePage = '/';

  final List<String> _pages = const [
    AnimatedAlignExample.screenRoute,
    AnimatedContainerExample.screenRoute,
    AnimationTextStyleExample.screenRoute,
    AnimatedOpacityExample.screenRoute,
    AnimatedPaddingExample.screenRoute,
    AnimatedPhysicalModelExample.screenRoute,
     AnimatedPositionExample.screenRoute,
     AnimationPositionDirectionalExample.screenRoute,
     AnimatedCrossFadeExample.screenRoute,
     AnimatedSwitcherExample.screenRoute,
     AnimatedListExample.screenRoute,

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _pages.length,
            itemBuilder: (context, index) => ElevatedButton(onPressed: () => Navigator.pushNamed(context, _pages[index]), child: Text(_pages[index].toString())),
          ),
        ],
      ),
    );
  }
}
