# Assembly Language Basics

Assembly language is a low-level programming language that is closely related to machine code. It provides a way to write instructions that can be directly executed by a computer's processor.

## What is Assembly Language?

Assembly language is a human-readable representation of machine code. It uses mnemonic instructions to represent specific operations that the processor can perform. Each instruction corresponds to a specific machine code instruction, which is a binary representation of the operation.

## Why Use Assembly Language?

Assembly language is often used in situations where low-level control over the hardware is required. It allows programmers to write highly optimized code that can directly access and manipulate hardware resources. It is commonly used in embedded systems, device drivers, and operating system development.


### Advantages of the Assembly language
Using Assembly language allows you to understand:  
* how programs interact with the operating system, processor, and BIOS;
* how data is represented in memory and other devices;
* how does the processor access instructions and how does it execute them;
* how instructions access and process data;
* how the program gets access to external devices.
  
Other advantages of using the Assembly language:
* requires less memory;
* faster execution;
* simplifies complex hardware tasks.  

### Main features of PC hardware

The main hardware of a PC consists of a processor, memory, and registers. Registers are processor components that contain data and their addresses in memory. To execute a program, the system copies it from an external device to internal memory. The processor then executes the program instructions.
Data in the computer is stored in bits: 1 (on) or 0 (off).

The processor supports the following data sizes:
* word: 2-byte data element;
* double word: a 4-byte (32-bit) data element;
* quadword: an 8-byte (64-bit) data element;
* paragraph: 16-byte (128-bit) area;
* kilobyte: 1024 bytes;
* megabyte: 1,048,576 bytes.  

### Binary notation
Every number system uses positional notation. Ie the position in which the recorded bits have a different positional value. Each subsequent positional value consists of the previous positional value multiplied by 2 (exactly by 2, since this is a binary system that consists of 2 numbers). If the bit is 1, the positional value is multiplied by 2, and if 0, the positional value remains 0. In the binary system, counting is done from right to left, not from left to right (as in the decimal system).

For example, the following table shows the positional values of the 8-bit binary number `11111101`:  
|Bit|1|1|1|1|1|1|0|1|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Positional value|128|64|32|16|8|4|0|1|
|Number bit|7|6|5|4|3|2|1|0|  

The value of a binary number is equal to the sum of the positional values of all the bits:

1 + 4 + 8 + 16 + 32 + 64 + 128 = 253

Binary 11111101 = decimal 253.

### Addressing data in memory
The process by which the processor manages the execution of instructions is called an execution cycle, which consists of three consecutive steps:
* retrieving instructions from memory;
* the decoding or identification of the user;
* statement execution.

The processor can access one or more bytes of memory at the same time. For example, consider the hexadecimal value 0824H, which takes up 2 bytes of memory. The high – order byte or high-value byte is 08, and the low-order byte is 24.

The processor stores data in reverse sequence of bytes, i.e. bytes, LSB stored in lower memory address (left side) and the high order bytes in the upper memory address (right). Thus, if the processor transfers the value 0824H from the register to memory, then 24 will be at the beginning of the line, and 08-at the end, but the processor will read data from right to left, not from left to right

## Assembly Language Syntax

Assembly language syntax varies depending on the processor architecture. However, there are some common elements that are found in most assembly languages.

### Statements
There are three types of statements in assembler:
* Executable instructions (or simply "instructions") that tell the processor what to do. Each instruction stores an operation code (or "opcode") and generates one instruction in machine language.
* Assembler directives that tell the program about aspects of the compilation. They do not generate instructions in machine language.
* Macros that are a simple mechanism for inserting code.
In assembler, there is one statment per line, which must correspond to the following format:  
`[label] mnemonic [operands] [; comment]`  
The basic instruction consists of the instruction name (mnemonic) and operands (also known as "parameters"). Here are some examples of typical Assembly language statements:
```
INC COUNT        ; performing an increment of the memory variable COUNT
 
MOV TOTAL, 48    ; moving the value 48 to the memory variable TOTAL
					  
ADD AH, BH       ; adding the contents of the BH register to the AH register
					  
AND MASK1, 128   ; perform the AND operation with the MASK 1 and 128 variables 
					  
ADD MARKS, 10    ; adding 10 to the MARKS variable
MOV AL, 10       ; moving the value 10 to the AL registr
```

### Memory segment
The segmented memory model splits system memory into groups of independent segments that are pointed to by pointers located in the segment registers. Each segment is used for storing a specific type of data. One segment is used for storing instruction code, the second for storing data elements, and the third for the software stack.

Memory segment:
Data segment-represented by the .data and .bss sections.  
Section .data is used to declare the memory area where data items for the program are stored. This section cannot be expanded after declaring data elements, and it remains static throughout the program.  
Section .the bss is also a section of static memory that contains buffers for data that will be declared in the program later. This buffer memory is filled with zeros.
Code segment-represented by the .text section. It defines the area in memory where instruction codes are stored. This is also a fixed area.
A stack is a segment that contains data values passed to functions and procedures in a program.

### Registers
Usually, operations with the processor include data processing. This data can be either stored in memory or extracted from it. However, the process of reading data from memory and storing data in memory slows down the processor, since this involves a complex process of sending a data request through the control bus to the memory block and receiving data over the same channel.

To speed up its work, the processor connects certain internal memory storage locations, called registers. Registers store data elements for processing without needing to access memory. A limited number of registers are built into the processor chip.

Some of these data registers have specific applications in arithmetic operations.

AX (primary accumulator) is used for I/o and most arithmetic operations. For example, in a multiplication operation, one operand is stored in the eax or AX or AL register according to the size of the operand.

BX (base register) is used for indexed addressing.

CX (count register) stores the number of cycles in repeated operations (just like the ECX and CX registers).

DX (data register) is used in I/o operations, as well as with the AX and DX registers to perform multiplication and division operations associated with large values.

### Pointer registers
The pointer registers are the 32-bit EIP, ESP, and EBP registers and the corresponding 16-bit IP, SP, and BP registers. There are three categories of pointer registers:
* Instruction Pointer or IP-the 16-bit IP register stores the address offset of the next command to be executed. IP combined with the CS register (as CS:IP) provides the full address of the current instruction in the code segment.
* Stack pointer (SP) — the 16-bit SP register provides the offset value in the software stack. SP in combination with the SS register (SS:SP) refers to the current position of data or address in the software stack.
* Base pointer (BP)-the 16-bit BP register is used mainly when passing parameters to routines. The address in the SS register is combined with the offset in BP to get the parameter location. BP can also be combined with DI and SI as the base register for special addressing.  
### Control register
The control register is a combined 32-bit instruction register and 32-bit flag register (the processor register that reflects its current state). Many instructions include comparison operations and mathematical calculations that can change the state of flags, and some other conditional instructions check the values of state flags to move the control flow to another location.

Common bit flags:
* Overflow Flag (or OF) — indicates the overflow of the highest data bit (the leftmost bit) after the signed arithmetic operation.
* Direction flag (Direction Flag or DF) — specifies the direction to the left or right for moving or comparing string data. If DF = 0, the string operation takes a left-to-right direction, and when DF = 1, the string operation takes a right-to-left direction.
* Interrupt Flag or IF — specifies whether external interrupts (such as keyboard input, etc.) will be ignored or processed.it disables external interrupts when the value is 0, and allows interrupts when the value is set to 1.
* Trap flag (or TF) - allows you to configure the processor in one-step mode.
* Sign Flag (sign Flag or SF) — shows the sign of the result of an arithmetic operation. This flag is set according to the character of the data element after performing an arithmetic operation. The sign is determined by the highest left bit. A positive result resets the SF value to 0, and a negative result sets it to 1.
* Zero flag (Zero Flag or ZF) — indicates the result of an arithmetic operation or comparison operation. A non-zero result resets the null flag to 0, and a null result sets it to 1.
* Auxiliary Carry Flag (AF) — after performing an arithmetic operation, it contains a transfer from bit 3 to bit 4.it is Used for specialized arithmetic. AF is set when a 1-byte arithmetic operation causes a transfer from bit 3 to bit 4.
* Equality flag (Parity Flag or PF) — specifies the total number of 1-bits in the result obtained after performing an arithmetic operation. An even number of 1-bits resets PF to 0, and an odd number of 1-bits sets PF to 1.
* Carry Flag (CF) — after performing an arithmetic operation, it contains the carry 0 or 1 from the highest bit (far left). It also stores the contents of the last bit of the shift or rotate operation.

### Segment register

Segments are specific parts of a program that contain data, code, and a stack. There are three main segments:
* Code Segment (code Segment or CS) — contains all commands and instructions that must be executed. A 16-bit code segment register or CS register stores the starting address of the code segment.
* Data Segment (Data Segment or DS) — contains data, constants, and workspaces. A 16-bit data segment register or DS register stores the starting address of the data segment.
* Stack Segment (SS) — contains data and return addresses of procedures or subroutines. It is represented as a "Stack"data structure. The stack segment register or SS register stores the start address of the stack.
In addition to the CS, DS, and SS registers, there are other additional segment registers (Extra Segment or ES), FS, and GS that provide additional segments for data storage.
When writing programs in Assembly language, the program needs access to memory cells. All memory areas in a segment refer to the segment's starting address. The segment begins with an address that is evenly divisible by decimal 16 or hexadecimal 10. Thus, the rightmost hexadecimal digit in all such memory addresses is 0, which is not usually stored in segment registers.
Segment registers store the initial addresses of the segment. To get the exact location of a data or command in a segment, an offset value is required. To refer to any memory cell in a segment, the processor combines the segment address in the segment register with the location offset value.

### Sources

http://asmongueur.free.fr/Apprendre/Nasm/Intro_Nasm_Linux.htm