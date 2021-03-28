import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcs/main.dart';

void main() {
  runApp(
      MaterialApp(
        home: SampleSplash(),
      )
  );
}

class SampleSplash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SampleSplash>  {
  @override
  void initState(){
    super.initState();

    loadData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
        child: Image.asset('splash.gif',
          fit: BoxFit.contain,)
    );

  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2),onDoneLoading);

  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
  }
}