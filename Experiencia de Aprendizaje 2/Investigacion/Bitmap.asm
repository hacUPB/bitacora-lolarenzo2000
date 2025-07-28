@KBD
D=M
@100
D=D-A
@draw
D;JEQ
@erase
0;JMP

(erase)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 1
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0 // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0 // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0 // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=0
	// return
	@R13
	A=M
	D;JMP

(draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 1
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@16352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@252 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@14560 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// return
	@R13
	A=M
	D;JMP