import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
          MyHomePage(title: ''),
      ));
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.jpeg"),
                radius: 100,
              ),
              SizedBox(
                height: 21,
              ),
              Text('BMI Calculator',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}