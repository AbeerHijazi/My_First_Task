import 'package:first_task/login_screen.dart';
import 'package:first_task/register_screen.dart';
import 'package:first_task/round_button.dart';
import 'package:flutter/material.dart';

class background extends StatelessWidget {

  const background({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final color;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/background.jpg'),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height*0.015,),
          Image.asset('assets/JawwalPay.png',height: 300, width: 300,),
          SizedBox(height: size.height*0.05,),
          Row(
            children: <Widget>[
              round_button(text: "Login",color: Colors.white,
                press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return login_screen();
                        }
                        )
                );
                },
              ),
              round_button(text: "Register Now",color: Colors.white, press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return register_screen();
                        }
                    )
                );
              },),
            ],
          ),
          SizedBox(height: size.height*0.08,),
          const Text('Now! Quick Login Use Touch ID',style: TextStyle(color: Colors.white),),
          SizedBox(height: size.height*0.07,),
          Image.asset('assets/fingerprint.png',height: 100, width: 100,),
          SizedBox(height: size.height*0.025,),
          const Text('Use Touch ID',style: TextStyle(color: Colors.white, decoration: TextDecoration.underline), ),
        ],
      ),
    );

  }
}

