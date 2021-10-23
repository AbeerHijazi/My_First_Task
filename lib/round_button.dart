import 'package:flutter/material.dart';

class round_button extends StatelessWidget {
  final String text;
  final Function() press;
  final color, textColor;
  const round_button({
    Key? key,  required this.text,  required this.press, this.color=Colors.white, this.textColor=Colors.lightBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, ),
      width: size.width*0.4,
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