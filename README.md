# LIBASM

## The subject

With this subject you have to construct your own library in assembly containing the following function :

1. __Mandatory__
	1. ft_strlen
	2. ft_strcpy
	3. ft_strcmp
	4. ft_write
	5. ft_read
	6. ft_strdup

## Assembly

The assembly langage is a low-level langage programation that acts directly on the processor. It is an human-readable representation of binairy langage via differents instructions sets. Theses instructions are the commands that can be used, so you can only manipulate two things : registers and memories. Each set of instructions is adaptative to the processor.

### What is a register ?

The registers store data elements for processing without having to access the memory. A limited number of registers are built into the processor chip. A register is either 32 or 64 bits, depending on your architecture. Due to the small nature of the registers, in assembly, you are required to use instructions, manipulate registers, segments, and flags.

### Segments

Each segment is used to contain a specific type of data, such as the __.bss__ a static memory section that contains buffers for data used; the __.data__ section is used to declare the region where data elements are stored for the program; the __.text__ section defines an area in memory that stores the instruction codes.

### Registers

A register is a small stockage zone in the micro-processor. They have standardized name : __RAX__, a general used to accumulate the return values; __RBX__ is used for general purpose; __RCX__, as a counter for rotation or in loops; __RDX__ for data, and arithmetique purpose; __RSP__ is the top of the stack, while __RBP__ is the base; __RSI__ is the source zone and __RDI__ is the destination zone.

### Flags

A special type of registers where each bits carry an information on the processor state or the results of the last operation: where __ZF__ (Zero Flag) if the result of the last operation is 0; __SF__ (Sign Flag) if the result is negative; __CF__ (Carry Flag) holds the arithmetic carry; __DF__ (Direction Flag) indicates if the address are either incrementing or decrementing; __OF__ if the result of the last operation is too big for a register.

### Instructions

A program is a list of instructions, ideally one per ligne. We follow the following convention :

instruction arg/source, destination

Among the most commons instruction, you can find __push__ to a data on the stack; __mov__ dest, src, which allows you to copy the source into the destination; __add__ and __sub__ are respectively addition and substraction, while __inc__ and __dec__ are respective increment and decrement.
There is also instructions that are executed during the execution, such as comparison (__cmp__) or jumps to a specific address with the __JMP__ instructions, and even __call__ other programs to their __adr__.

## Sources

[Assembly Tutorial](https://www.tutorialspoint.com/assembly_programming/index.htm)

[Assembleur x86-64](https://perso.univ-st-etienne.fr/ezequel/L2info/coursAssembleur_x86_64.pdf)
