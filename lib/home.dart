import 'package:animation/animation/explicit_animation/animated_builder_example.dart';
import 'package:animation/animation/explicit_animation/default_text_style_transition_example.dart';
import 'package:animation/animation/explicit_animation/fade_transition_example.dart';
import 'package:animation/animation/explicit_animation/indexed_stack_transition_example.dart';
import 'package:animation/animation/explicit_animation/positioned_directioned_example.dart';
import 'package:animation/animation/explicit_animation/positioned_transition_example.dart';
import 'package:animation/animation/explicit_animation/rotation_transition_example.dart';
import 'package:animation/animation/explicit_animation/size_transition_example.dart';
import 'package:animation/animation/explicit_animation/tween_animation_builder_example.dart';
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
import 'package:animation/animation/page_transition/navigation_page.dart';
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
    PositionedTransitionExample.screenRoute,
    SizeTransitionExample.screenRoute,
    RotationTransitionExample.screenRoute,
    AnimatedBuilderExample.screenRoute,
    FadeTransitionExample.screenRoute,
    PositionedDirectionedExample.screenRoute,
    TweenAnimationBuilderExample.screenRoute,
    DefaultTextStyleTransitionExample.screenRoute,
    IndexedStackTransitionExample.screenRoute,
    NavigationPage .fadeScreenRoute,
    NavigationPage .scaleScreenRoute,
    NavigationPage .rotationScreenRoute,
    NavigationPage .slideScreenRoute,
    NavigationPage .sizeScreenRoute,
    NavigationPage .mixSizeFadeTransition,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation in Flutter',
          style: TextStyle(color: Colors.orangeAccent),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, _pages[index]),
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(index <= 10 ? Colors.deepOrange : Colors.blueGrey)),
          child: Text(_pages[index].toString()),
        ),
      ),
    );
  }
}
