
import 'package:first_task/background_login.dart';
import 'package:first_task/login_screen.dart';
import 'package:first_task/round_button1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bodyy extends StatefulWidget {
  const Bodyy({
    Key? key,
  }) : super(key: key);

  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background_login(child: Column(
      //
      children:<Widget> [
        Expanded(
          child: Padding(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            padding: const EdgeInsets.only(top: 70),
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
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                        children:const <Widget> [
                          Text('Create account',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),),
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
                              hintText: "Enter your name here",
                              hintStyle: TextStyle(fontSize: 12),
                              labelText: 'User Name*',
                              labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                              suffixIcon: Icon(Icons.person),

                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey,width: 0.5),
                              //   )
                            ),
                            keyboardType: TextInputType.emailAddress,
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
                              hintText: "Enter your phone number here",
                              hintStyle: TextStyle(fontSize: 12),
                              labelText: 'Phone number*',
                              labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                              suffixIcon: Icon(Icons.phone),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.grey,width: 0.5),
                              //   )
                            ),

                            keyboardType: TextInputType.phone,
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
                            controller: myController2,
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
                  SizedBox(height: size.height*0.02,),
                  round_button1(text: "Register Now", press: () {

                    String p = myController1.text;
                    String pa = myController2.text;
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
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your registration done successfully, you will receive a massage ")));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return login_screen();
                                    }
                                )
                            );
                          }
                        }
                      }
                    }

                  },),
                  SizedBox(height: size.height*0.02,),
                  const Text('Or Register using social media',style: TextStyle(color: Colors.black, fontSize: 14),),

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
                  SizedBox(height: size.height*0.04,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,10,30,0),
                    child: Row(
                      children: const <Widget>[
                        Text('Already have an account? ',style: TextStyle(color: Colors.black, fontSize: 14),),
                        Text('Login',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold, decoration: TextDecoration.underline), ),
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




