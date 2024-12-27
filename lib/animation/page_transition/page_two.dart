import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
    static const screenRoute = 'Page Two';


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
