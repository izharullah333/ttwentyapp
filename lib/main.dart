import 'package:flutter/material.dart';
import 'package:ttwentyapp/screens/Splaish_Screen.dart';

void main() {
  runApp(const Home());
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplishScreen(splashTransition: null,),
    );
  }
}


