import 'dart:async';
import 'package:flutter/material.dart';
import 'package:updt/views/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()
    )
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mobi', style: TextStyle(
                      color: Colors.blue,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('News', style: TextStyle(
                      color: Colors.black,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                )
          ],
        ),
      ),
    );
  }

}
     