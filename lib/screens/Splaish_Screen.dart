import 'package:flutter/material.dart';
import 'home_screen.dart';


class SplishScreen extends StatefulWidget {
  const SplishScreen({Key? key, required splashTransition}) : super(key: key);

  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState(){
    super.initState();
    navigattohome();
  }
  navigattohome()async{
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const homeScreen();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage('assets/image/splash.png',
            ),
        )
      ),
    );
  }
}
