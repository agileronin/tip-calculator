import 'package:flutter/material.dart';

class TestScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'barber',
                  child: Image.asset(
                    'assets/images/barber.jpg',
                    fit: BoxFit.contain,
                ),
              ),
              Text('Page 1'),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/test2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
