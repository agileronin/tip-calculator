import 'package:flutter/material.dart';

class TestScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Hero(
            tag: 'barber',
            child: Image.asset(
              'assets/images/barber.jpg',
              fit: BoxFit.fitHeight
            ),
          ),
        ),
      ),
    );
  }
}
