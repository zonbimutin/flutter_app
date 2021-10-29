import 'dart:async';

import 'package:flutter/material.dart';

import 'gesture_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Cookies Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var timers = [];

  int clickSeconds = 1;
  int clickPrice = 16;

  int handSeconds = 2;
  int handPrice = 36;


  void _incrementCounter(int value) {
    setState(() {
      _counter += value;
    });
  }

  void _payForClicker(int price, int value) {

    int newCount = _counter - price;
    setState(() {
      _counter = newCount;
    });

    _setClicker(value);
  }

  void _setClicker(int value) {

    var oneSec = const Duration(seconds: 1);
    var timer = Timer.periodic(oneSec, (Timer t) => _incrementCounter(value));
    timers.add(timer);
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //color: Colors.lightGreen,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black26,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterCookies(counter: _counter),
                  Image.asset(
                    'assets/images/cookie.png',
                    fit: BoxFit.cover, // this is the solution for border
                    width: 40.0,
                    height: 40.0,
                  ),
                ],
              ),
            ),
            Container(
              // height: 300.0,
              // width: 300.0,
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () => _incrementCounter(1), // handle your image tap here
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/halo.png',
                      fit: BoxFit.cover, // this is the solution for border
                      width: 280.0,
                      height: 280.0,
                    ),                    Image.asset(
                      'assets/images/cookie.png',
                      fit: BoxFit.cover, // this is the solution for border
                      width: 250.0,
                      height: 250.0,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  GestureButton(
                    isActive: _counter >= handPrice,
                    image: Image.asset(
                      'assets/images/hand.png',
                      fit: BoxFit.cover, // this is the solution for border
                      width: 50.0,
                      height: 50.0,
                    ),
                    clicksPerSecond: handSeconds,
                    price: handPrice,
                    handleTap: () =>_payForClicker(handPrice, handSeconds)
                  ),
                GestureButton(
                    isActive: _counter >= clickPrice,
                    image: Image.asset(
                      'assets/images/click.png',
                      fit: BoxFit.cover, // this is the solution for border
                      width: 50.0,
                      height: 50.0,
                    ),
                    clicksPerSecond: clickSeconds,
                    price: clickPrice,
                    handleTap: () =>_payForClicker(clickPrice, clickSeconds)
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CounterCookies extends StatelessWidget {
  const CounterCookies({
    Key? key,
    required int counter,
  }) : _counter = counter, super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '$_counter',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
