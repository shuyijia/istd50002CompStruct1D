### OPCODE ALUFN

-------

#### ADDER

ALUFN[5:4] = `00`



ADD:    `0000`
SUB:    `0001`
MUL:    `0010`
DIV:    `0011`

-----

#### BOOLEAN
ALUFN[5:4] = `01`



AND     `1000`
OR      `1110`
A       `1010`
INVA   `1111`

----

#### SHIFT
ALUFN[5:4] = `10`



SHL    `0000`
SHR     `0001`
SRA    `0011`

----

#### COMPARATOR
ALUFN[5:4] = `11`



CMPEQ   `0001`
CMPLT   `0010`
CMPLE  `0011`

----

