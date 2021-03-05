import 'package:calculator/calc/src/lexer.dart';
import 'package:calculator/calc/src/parser.dart';

class Calc {

    static String execute(String input) => Parser(tokens: Lexer(input).makeTokens()).parse().getVal();

}