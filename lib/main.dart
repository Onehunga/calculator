import 'package:calculator/calc/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Calculator(),
        );
    }
}

class Calculator extends StatefulWidget {
    @override
    _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
    
    String _input;

    @override
    void initState() {
        _input = '';
        super.initState();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    
                    Text(_input),

                    Row(
                        children: <Widget>[
                            _numButton('7'),
                            _numButton('8'),
                            _numButton('9'),
                            _operatorButton('/')
                        ],
                    ),

                    Row(
                        children: <Widget>[
                            _numButton('4'),
                            _numButton('5'),
                            _numButton('6'),
                            _operatorButton('*')
                        ],
                    ),

                    Row(
                        children: <Widget>[
                            _numButton('1'),
                            _numButton('2'),
                            _numButton('3'),
                            _operatorButton('-')
                        ],
                    ),

                    Row(
                        children: <Widget>[
                            _numButton('.'),
                            _numButton('0'),
                            _operatorButton('='),
                            _operatorButton('+'),
                        ],
                    )

                ],
            ),
        );
    }

    Widget _numButton(String _num) {
        return Expanded(
            child: TextButton(
                child: Text(_num),
                onPressed: () {
                    setState(() {
                        _input += _num;
                    });
                },
            ),
        );
    }

    Widget _operatorButton(String op) {
        return Expanded(
            child: TextButton(
                child: Text(op),
                onPressed: () {
                    setState(() {
                        if(op != '=') {
                            _input += ' $op ';
                        }
                        else {
                            _input = Calc.execute(_input);
                        }
                    });
                },
            ),
        );
    }

}