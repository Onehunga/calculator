import 'package:calculator/calc/calculator.dart';
import 'package:calculator/widgets/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Calculator',
            home: Calculator(),
        );
    }
}

class Calculator extends StatefulWidget {
    @override
    _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

    String _history;
    String _input;

    @override
    void initState() {
        _history = '';
        _input = '';
        super.initState();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xFF283637),
            body: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Text(
                                    _history,
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xFF545F61)
                                        )
                                    ),
                                ),
                            ),
                            alignment: Alignment(1.0, 1.0),
                        ),
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                    _input,
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 48,
                                            color: Colors.white,
                                        ),
                                    ),
                                ),
                            ),
                            alignment: Alignment(1.0, 1.0),
                        ),
                        SizedBox(height: 40),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                CalcButton(
                                    text: 'AC',
                                    fillColor: 0xFF6C807F,
                                    textSize: 20,
                                    callback: _clearAll,
                                ),
                                CalcButton(
                                    text: 'C',
                                    fillColor: 0xFF6C807F,
                                    callback: _clear,
                                ),
                                CalcButton(
                                    text: '%',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    callback: _fromPercent,
                                ),
                                CalcButton(
                                    text: '/',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    callback: _numClick,
                                ),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                CalcButton(
                                    text: '7',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '8',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '9',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '*',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    textSize: 24,
                                    callback: _numClick,
                                ),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                CalcButton(
                                    text: '4',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '5',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '6',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '-',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    textSize: 38,
                                    callback: _numClick,
                                ),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                CalcButton(
                                    text: '1',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '2',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '3',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '+',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    textSize: 30,
                                    callback: _numClick,
                                ),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                CalcButton(
                                    text: '.',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '0',
                                    callback: _numClick,
                                ),
                                CalcButton(
                                    text: '00',
                                    callback: _numClick,
                                    textSize: 26,
                                ),
                                CalcButton(
                                    text: '=',
                                    fillColor: 0xFFFFFFFF,
                                    textColor: 0xFF65BDAC,
                                    callback: _solve,
                                ),
                            ],
                        )
                    ],
                ),
            ),
        );
    }

    void _numClick(String input) {
        setState(() {
            _input += input;
        });
    }

    void _solve(String input) {

        String res = Calc.execute(_input);
        num t = num.parse(res);

        //check if the result is an int
        if(t == t.floor()) {
            t = t.floor();
        }
        
        setState(() {
            _history = _input;
            _input = t.toString();
        });
    }

    void _fromPercent(String input) {

        String res = Calc.execute(_input);
        num t = num.parse(res);
        t /= 100;

        //check if the result is an int
        if(t == t.floor()) {
            t = t.floor();
        }

        setState(() {
            _history = '$_input $input';
            _input = t.toString();
        });
    }

    void _clear(String input) {
        setState(() {
            _input = '';
        });
    }

    void _clearAll(String input) {
        setState(() {
            _history = '';
            _input = '';
        });
    }

}