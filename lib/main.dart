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
import 'package:animation/animation/page_transition/page_fade_transition.dart';
import 'package:animation/animation/page_transition/page_rotation_transition.dart';
import 'package:animation/animation/page_transition/page_scale_transition.dart';
import 'package:animation/animation/page_transition/navigation_page.dart';
import 'package:animation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: Home.homePage,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Home.homePage:
            return MaterialPageRoute(builder: (context) => const Home());
          case AnimatedAlignExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedAlignExample());
          case AnimatedContainerExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedContainerExample());
          case AnimationTextStyleExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimationTextStyleExample());
          case AnimatedOpacityExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedOpacityExample());
          case AnimatedPaddingExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedPaddingExample());
          case AnimatedPhysicalModelExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedPhysicalModelExample());
          case AnimatedPositionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedPositionExample());
          case AnimationPositionDirectionalExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimationPositionDirectionalExample());
          case AnimatedCrossFadeExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedCrossFadeExample());
          case AnimatedSwitcherExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedSwitcherExample());
          case AnimatedListExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedListExample());
          case PositionedTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const PositionedTransitionExample());
          case SizeTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const SizeTransitionExample());
          case RotationTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const RotationTransitionExample());
          case AnimatedBuilderExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const AnimatedBuilderExample());
          case FadeTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const FadeTransitionExample());
          case PositionedDirectionedExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const PositionedDirectionedExample());
          case TweenAnimationBuilderExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const TweenAnimationBuilderExample());
          case DefaultTextStyleTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const DefaultTextStyleTransitionExample());
          case IndexedStackTransitionExample.screenRoute:
            return MaterialPageRoute(builder: (context) => const IndexedStackTransitionExample());
          case NavigationPage.fadeScreenRoute:
            return  PageFadeTransition(page: const NavigationPage());
          case NavigationPage.scaleScreenRoute:
            return  PageScaleTransition(page: const NavigationPage());
          case NavigationPage.rotationScreenRoute:
            return  PageRotationTransition(page: const NavigationPage());

          default:
        }
        return null;
      },
    );
  }
}
