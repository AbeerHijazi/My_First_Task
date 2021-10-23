import 'package:first_task/background_login.dart';
import 'package:first_task/homepage.dart';
import 'package:first_task/round_button1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String p,pa;
    return background_login(child: Column(
      //
      children:<Widget> [
        Expanded(
            child: Padding(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Column(
                          children: <Widget> [
                            Image.asset('assets/JawwalPay.png', scale: 1.4,),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Column(
                          children:const <Widget> [
                            Text('Hello',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 5),
                      child: Column(
                          children:const <Widget> [
                            Text('Sign into your account',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Column(
                          children: <Widget> [
                            TextField(
                              controller: myController,
                              decoration: const InputDecoration(
                                hintText: "Enter your phone number here: 059******",
                                hintStyle: TextStyle(fontSize: 12),
                                labelText: 'Phone number*',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                                suffixIcon: Icon(Icons.phone),

                              ),
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              cursorColor: Colors.grey,

                            )

                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Column(
                          children: <Widget> [
                            TextField(
                              controller: myController1,
                              decoration: const InputDecoration(
                                hintText: "Enter your password here",
                                hintStyle: TextStyle(fontSize: 12,),
                                labelText: 'Password*',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                                suffixIcon: Icon(Icons.visibility_off),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide: BorderSide(color: Colors.grey,width: 0.5),
                                //   )
                              ),

                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                            )

                          ]


                    ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    round_button1(text: "Login", press: () {
                      p = myController.text;
                      pa = myController1.text;
                      int c = checkphone(p.toString());
                      if(c==1){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Phone number should start with 059.")));
                      }else{
                        if(c==2){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Phone number should contains 10 numbers")));
                        }else{
                          int cc = checkpassword(pa.toString());
                          if(cc==3){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The password must be more than 8 digit.")));
                          }else{
                            if(cc==4){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The password must contains (Upper-lower case, special char and number")));
                            }else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context){
                                        return homepage();
                                      }
                                  )
                              );
                            }
                          }
                        }
                      }

                    },),
                    SizedBox(height: size.height*0.02,),
                    const Text('Or Login using social media',style: TextStyle(color: Colors.black, fontSize: 14),),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(140,10,30,0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/facebook.png', scale: 20,),
                          SizedBox(width: size.height*0.03,),
                          Image.asset('assets/twitter.png', scale: 18,),
                          SizedBox(width: size.height*0.03,),
                          Image.asset('assets/google.png', scale: 12,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.07,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100,10,30,0),
                      child: Row(
                        children: const <Widget>[
                          Text('Don\'t have an account? ',style: TextStyle(color: Colors.black, fontSize: 14),),
                          Text('Register Now!',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold, decoration: TextDecoration.underline), ),
                        ],
                      ),
                    ),
                  ]
              ),

            ),
        )




      ],
    ),);

  }
}

int checkphone(String number){
  bool s = number.startsWith('059');
  bool l = number.length == 10;
  if(s==false){
    return 1;
  }else{
    if(l==false){
      return 2;
    }else{
      return 0;
    }
  }
}

int checkpassword(String number){
  bool v = validateStructure(number.toString());
  if(number.length<7){ //the length must be more than 8 digit
    return 3;
  }else{
    if(v==false){// contains all required chara
      return 4;
    }else{
      return 0;
    }
  }
}

bool validateStructure(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}









