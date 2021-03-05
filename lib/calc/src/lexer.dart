import 'tokens.dart';

const DIGITS = '0123456789';

class Lexer {

    final String text;
    String currentChar;
    int pos;

    Lexer(this.text) {
        currentChar = null;
        pos = -1;
        advance();
    }

    void advance() {
        pos++;
        currentChar = pos < text.length ? text[pos] : null;
    }

    List<Token> makeTokens() {

        List<Token> tokens = <Token>[];

        while(currentChar != null && pos < text.length) {

            if(currentChar == ' ' || currentChar == '\t') {
                advance();
            }
            else if (DIGITS.contains(currentChar)) {
                tokens.add(makeNum());
            }
            else {

                switch(currentChar) {
                    case '+':
                        tokens.add(Token(type: TOKENS.PLUS));
                        advance();
                        break;
                    case '-':
                        tokens.add(Token(type: TOKENS.MINUS));
                        advance();
                        break;
                    case '*':
                        tokens.add(Token(type: TOKENS.MUL));
                        advance();
                        break;
                    case '/':
                        tokens.add(Token(type: TOKENS.DIV));
                        advance();
                        break;
                    default:
                        //throw an error

                }

            }

        }

        return tokens;

    }

    Token makeNum() {
        
        String n = '';
        int dotCount = 0;

        while(currentChar != null && (DIGITS + '.').contains(currentChar)) {
            if(currentChar == '.') {
                if (dotCount == 1) {
                    break;
                }
                dotCount++; 
            }
            n += currentChar;
            advance();
        }

        return Token(type: TOKENS.NUM, value: n);

    }

}