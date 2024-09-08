import 'dart:developer';

import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),

    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var bgcolor=Colors.indigo.shade200;

  var result='';
 // var bgcolor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('                            BMI APP'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo1.jpeg'),
                    radius: 100,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text('BMI CALCUTION',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text("enter your weight in kg"),
                      prefixIcon: Icon(Icons.line_weight_outlined),

                    ),
                    keyboardType: TextInputType.number
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text("enter your height in feet"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("enter your height in Inch"),
                      prefixIcon: Icon(Icons.height_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(onPressed: (
                      ){

                    var wt= wtController.text.toString();
                    var ft=ftController.text.toString();
                    var inch=inController.text.toString();
                    if(wt!=""&&ft!=""&&inch!=""){
                      var iwt=int.parse(wt);
                      var ift=int.parse(ft);
                      var nch=int.parse(inch);
                      var tnch=(ift*12)+nch;
                      var tcm=(tnch*2.54);
                      var tm=(tcm/100);
                      var bmi=(iwt/(tm*tm));
                      result="The bmi is ${bmi.toStringAsFixed(2)}";
                      var msg='';
                      if(bmi>25){
                        msg="your are OVER weight!!!";
                        bgcolor=Colors.red.shade200;
                      }else if(bmi<18){
                        msg="your are underweight!!!";
                        bgcolor=Colors.pink.shade200;

                      }else{
                        msg="your are Healty";
                        bgcolor=Colors.greenAccent.shade200;
                      }
                      result="The bmi is ${bmi.toStringAsFixed(2)}\n$msg";
                      setState(() {
                        result="The bmi is ${bmi.toStringAsFixed(2)}\n$msg";
                      });

                    }
                    else {
                      result = "please enter valid number";
                      setState(() {

                      });
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(result)));

                  },child: Text("Calculate")),
                  SizedBox(
                    height: 11,
                  ),
                  Text(result,style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      )

      
    );
  }
}
