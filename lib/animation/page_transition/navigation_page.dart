import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
    static const fadeScreenRoute = 'Page Fade';
    static const scaleScreenRoute = 'Page Scale';
    static const rotationScreenRoute = 'Page Rotation';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Animated Position '),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed:()=> Navigator.pop(context), child: const Text('Go Back',style: TextStyle(fontSize: 36,),)),
      ),
    );
  }
}