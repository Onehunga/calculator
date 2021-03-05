import 'nodes.dart';
import 'tokens.dart';

class Parser {

    final List<Token> tokens;
    Token currentToken;
    int tokenIndex;

    Parser({
        this.tokens,
    }) {
        tokenIndex = -1;
        advance();
    }

    Token advance() {
        tokenIndex++;
        if(tokenIndex < tokens.length) {
            currentToken = tokens[tokenIndex];
        }
        return currentToken;
    }

    Node parse() {
        Node res = expression();
        return res;
    }

    Node factor() {
        Node n;
        Token token = currentToken;
        if(token.type == TOKENS.NUM) {
            advance();
            n = NumberNode(token: token);
        }
        return n;
    }

    Node term() {
        return binop(factor, <TOKENS>[TOKENS.MUL, TOKENS.DIV]);
    }

    Node expression() {
        return binop(term, <TOKENS>[TOKENS.PLUS, TOKENS.MINUS]);
    }

    Node binop(Function fn, List<TOKENS> tokens) {
        Node left = fn();
        while(tokens.contains(currentToken.type)) {
            Token opToken = currentToken;
            advance();
            Node right = fn();
            left = OperatorNode(leftNode: left, operatorToken: opToken, rightNode: right);
        }
        return left;
    }

}