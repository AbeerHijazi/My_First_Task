import 'package:flutter/material.dart';

class round_button1 extends StatelessWidget {
  final String text;
  final Function() press;
  final color, textColor;
  const round_button1({
    Key? key,  required this.text,  required this.press, this.color=Colors.lightBlue, this.textColor=Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, ),
      width: size.width*0.65,
      height: 45,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(29),
        child: FloatingActionButton(
          heroTag: null,
          //padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: color,
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 17),),),
      ),

    );
  }
}