import 'package:flutter/material.dart';


class background_login extends StatelessWidget {
  final Widget child;
  const background_login({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/background_login.jpg'),
        ),
      ),
      child: child, //maybe error
    );
  }
}