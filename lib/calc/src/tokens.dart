enum TOKENS {
    NUM,
    PLUS,
    MINUS,
    MUL,
    DIV
}

class Token {

    final String value;
    final TOKENS type;

    Token({
        this.value,
        this.type
    }) {
        if(value == null && type == null) {
            print('pleasy enter a value for the token');
        }
    }

    @override
    String toString() => type != null && value != null ? '$type:$value' : type != null ? '$type' : value;

}