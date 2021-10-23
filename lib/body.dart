import 'package:flutter/material.dart';

import 'background.dart';


class body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background();
  }
}

