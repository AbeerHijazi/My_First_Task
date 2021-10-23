import 'package:flutter/material.dart';

import 'body.dart';

class welcome_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }
}