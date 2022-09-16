import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {
  final String title;
  final   IconData iconData ;
  final VoidCallback onPressed;
  const HomeItemWidget({
      required this.title,
      required this.iconData,
      required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Icon(iconData,
              size: 100,
              color: Colors.white,
            ),
            Text(title,
              style: const TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
