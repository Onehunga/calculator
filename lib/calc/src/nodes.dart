import 'tokens.dart';

class Node {
    String getVal() {
        return '';
    }
}

class NumberNode extends Node {

    final Token token;

    NumberNode({this.token});

    @override
    String toString() {
        return '$token';
    }

    @override
    String getVal() {
        return token.value;
    }

}

class OperatorNode extends Node {

    final Token operatorToken;
    final Node leftNode, rightNode;

    OperatorNode({
        this.operatorToken,
        this.leftNode,
        this.rightNode
    });

    @override
    String toString() {
        return '($leftNode, $operatorToken, $rightNode)';    
    }

    @override
    String getVal() {
        return solve().toString();
    }

    num solve() {
        num l = num.parse(leftNode.getVal());
        num r = num.parse(rightNode.getVal());
        num res;

        switch(operatorToken.type) {
            case TOKENS.PLUS:
                res = l + r;
                break;
            case TOKENS.MINUS:
                res = l - r;
                break;
            case TOKENS.MUL:
                res = l * r;
                break;
            case TOKENS.DIV:
                res = l / r;
                break;
        }

        return res;

    }

}