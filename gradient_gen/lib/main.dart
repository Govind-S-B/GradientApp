import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const AppMain());
}
class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  Random r = Random();
  
  int clr_a = 0xff6B7FD7;
  int clr_b = 0xffBCEDF6;
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(clr_a),Color(clr_b)])),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      clr_a = r.nextInt(0xffffffff);
                      clr_b = r.nextInt(0xffffffff);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(clr_b)
                  ), child: const Text("Next"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ElevatedButton(onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>resultpage(clr_a : clr_a,clr_b: clr_b,)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ), child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36
                      ),
                    ),),
                  ),
                ),
              )
            ],
          )
        ,
      ),
    );
  }
}

class resultpage extends StatefulWidget {

  int clr_a;
  int clr_b;

  resultpage({super.key,required this.clr_a,required this.clr_b});

  

  @override
  State<resultpage> createState() => _resultpageState(clr_a:clr_a,clr_b:clr_b);
}

class _resultpageState extends State<resultpage> {

  int clr_a ;
  int clr_b ;

  _resultpageState({this.clr_a = 0 ,this.clr_b = 0}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(clr_a),Color(clr_b)])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Color 1 : #"+clr_a.toRadixString(16),style: TextStyle(color: Colors.white , fontSize: 64),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Color 2 : #"+clr_b.toRadixString(16),style: TextStyle(color: Colors.white , fontSize: 64),),
            ),
          ],
        ),
      ),
    );
  }
}