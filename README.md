# CJCompiler

This is a simple compiler constructed using Flex lexer and Yacc parser.

This takes pseudo like code and then convert into an Arduino code.
In this initial step, it can only create simple arduino blinking programs.

# Example 

code : `turn on pin 13 for 5`

This will convert into equivelent arduino code which keeps port `13` high for `5s` by this compiler.

# Future

Soon :
 * To get multiple input ports.
 * Serial communication in Arduino

Later :
* Simple programming language for programming beginers which will be pseudo like codes.


## Development 

Ubuntu OS was used to develop this project.

### Install flex

`sudo apt-get install flex`

### Install YACC (Bison)

`sudo apt-get install bison`

[Install Flex and Yacc](https://stackoverflow.com/questions/3871425/how-to-install-lex-and-yacc-in-ubuntu)