<p style="text-align:left; font-weight:bold;">Build a Modern Computer from First Principles: From Nand to Tetris (Project-Centered Course)</p>
<a style="text-align:left; font-weight:bold;" href = "https://www.coursera.org/learn/build-a-computer"> Course Website</a>
<p style="text-align:left; font-weight:bold;">Book: The Elements for Computing Systems--Build a Modern Computer from First Principles</p>



# Week 1


1 Module 0: Introduction 

1. One only need to know about 'what' rather than 'how' to do programming
 * 'How' is about implementation, since you're only using the computers, you don't need to duplicate it, then you don't need to know how to make it actually happen.
 * 'What' is about abstraction, you care about what your program suppose to do, i.e., what will happen for each commands you write.
 * For multiple layers of abstraction, we only care about the upmost layer interface
![](/images/Nand/Layers.png)

2. From Nand to Hack
* The Hack Computer
![](/images/Nand/HackComputer.png)
* Nand is the most elementary logic gate. Other gates like combinatorial logic gates and sequential logic gates are built based on Nand.
* Use hardware simulator to design, test and debug the hardware that one wants to build.

3. From Hack to Tetris
* Rich language: expressions, loops, data types, classes, methods
* Built in operations: I/O, Math
* High level language, Complier
* Operating System, Standard Library

2 Module 1: Boolean Functions and Gate Logic 

1. Boolean Logic
   * Boolean operations:
      * `(x AND y)` or x $\land$ y 
      * `(x OR y)` or x $\lor$  y 
      * `NOT(x)` or $\neg$ x 
   * Boolean Functions
      * Example: `f(x, y, z) = (x AND y) OR (NOT(X) AND z)`
      * You can also use a truth table to describe a function apart from a formula
   * Boolean Identities:
      * `(x AND y) = (y AND x)`   this is a commutative law
      * `(x AND (y AND z)) = ((x AND y) AND z)` this is an associative law
      * `(x AND (y OR z)) = (x AND y) OR (x AND z)` this is a distributive law
      * `NOT(x AND y) = NOT(x) OR NOT(y)` this is a De Morgan Law

2. Boolean Function Synthesis
   * It's easy to draw a truth table from a boolean function, but the reverse process is actually what a computer does
   
   * The way converting a truth table into a boolean function formula is called constructing a disjunctive normal form
   
   * Steps:
      * Find a function for each row with a value 1, the function should take 1 for the current row and 0 for all other rows
      * Use `OR` to combine the all found functions
      * Reduce the combined function to one simple function
      
* Theorem: Any boolean function can be represented using an expression containing `AND`, and `NOT` operations.
  
      Proof: 
       
      `OR` can be replaced with `AND` and `NOT` using De Morgan Law: `(x OR y) = NOT(NOT(x) AND NOT(y))`
  
   * Nand function: `(x NAND y) = NOT(x AND y)`
  
   * Truth table for Nand:
  
      |  x   |  y   | Nand |
      | :--: | :--: | :--: |
      |  0   |  0   |  1   |
      |  0   |  1   |  1   |
      |  1   |  0   |  1   |
      |  1   |  1   |  0   |
  
   * Theorem: Any boolean function can be represented using only `NAND` operations.
  
   Proof:
  
   `NOT(x) = (x NAND x)`
      
      `(x AND y) = NOT(x NAND y)`
       
      Since `AND` and `NOT` can be represented by `NAND`, according to the previous theorem, any boolean functions then can be represented using `NAND`
  
3. Logic Gates
   * A logic gate is an idealized model of computation or physical electronic device implementing a boolean function. An ideal logic gate has zero rise time and unlimited fan-out, a non-ideal physical device is also a logic gate.
   * Elementary logic gate: `NAND`
   * Other elementary logic gate: `AND`, `OR`, `NOT`
   * Composite gates:
     * Example: a gate `(x AND y AND c)` can be regarded as a two step gate, `(x AND y)` and then `((x AND y) ANd c)`, the order of inputs doesn't change the result
   * Gate interface answers the question 'What', gate implementation answers the question 'How'. In this sense, gate interface is unique, since there is only one way to describe what the gate is supposed to do, but there may be multiple implementations that realize the gate interface abstraction.
     * Example: circuit implementations with light bulbs
  
4. Hardware Description Language(HDL)
   * Example: `Xor` gate:
     * Gate interface:   
      ![](/images/Nand/Xorgate.png)
     * Implementation:
      ```vhdl
          /**Xor gate: out = (a And Not(b)) OR (Not(a) And b) */
          CHIP Xor {
             IN a, b;
             OUT out;
          }

          PARTS:
          Not(in = a, out = nota);
          Not(int = b, out = notb);
          And(a = a, b = notb; out = aAndNotb);
          And(a = nota, b = b, out = notaAndb);
          Or(a = aAndNotb, b = notaAndb, out = out);
      ```
    * HDL definition of a chip consists of a header section and a parts section. The header section specifies the chip interface, namely the chip name and the names of its input and output pins. The parts section describes the names and topology of all the lower-level parts from which this chip is constructed, each part is represented by a statement that specifies the part name and the way it is connected to other parts in the design.
   
   * HDL is a functional/declarative language
   * The order of HDL statement is insignificant
   * Before using a chip part, one must know its interface
   * Connections of names are common
* HDL languages: VHDL, Verilog, etc
  
5. Hardware Simulation
   * Interactive simulation: the simulator only uses the HDL file
   * Script-based simulation: the simulator uses both the HDL file and the test script
   * With/without output and compare files: one can compare the output file with a compare file
   * Hardware construction projects:
     * System architects: decides which chips are needed, for each chip, creates the API, the test script and the compare file
     * Developers: given the resources, build the chips using hdl
  
6. Multi-bit Buses
   * Sometimes, manipulate together an array of bits is technically convenient, such a group of bits as a single entity is termed 'bus'
   * In HDL, there are some chips handling buses that bring much convenience and efficiency
   * Sub-bus:
     * Syntax: `a[16]`, `a[0..7] = lsb; a[8..15] = msb;`
     * Overlaps of sub-buses are allowed on output busses of parts
     * Width of internal pins is deduced automatically
     * `false(all 0s)` and `true(all 1s)` may be used as busses of any width

7. Project 1
   * Recommended chip-building procedure:
   ![](/images/Nand/Project1.png)
   






# Week 2

1. Binary Numbers
   * For $N$ bits, there are $2 ^N$ possible binary numbers
   * Convert a binary number to decimal number: $\sum\limits_{k=0}^{n} {2^k}$, where $k \in \{0, 1\}$
   * Convert a decimal number to decimal number: $\sum\limits_{t=0}^{n} {2^{k_t}} = Number$, then binary representation of the decimal number is: ${k_n}...{k_0}$
   * LSB(least significant number): the right-most bit in the binary representation of a number, a.k.a., hight-order bit
   * MSB(most significant number): the left-most bit in the binary representation of a number, a.k.a., low-order bit
   * Usually the MSB is used for sign, i.e., `MSB = 0` means a positive number, `MSB = 1` means a negative number
   
2. Binary Addition
   * If $sum < 2, \; position \; result = sum$, 
   
      if $sum \geq 2, \; position \; result = sum \;\%\; 2,\; next \; position \; carry = 1$
   * Overflow problem: since the computer has limited word size(the amount of bits to hold a number), if the calculation is beyond that, then the result is truncated in the following way: $\; result = result \;\%\; word \; size$, where $word \; size = 2^{N-1}$, since MSB is used for the sign of a number
   * Half adder: add two bits without considering possible position carry 
   * Full adder: add two bits with position carry taken into consideration
   * Adder: add two numbers

3. Negative numbers
   * Sign bit: if one uses this representation, then `1000` should not be -0, it should be -8. In this way, given the total word size $N$, the range is $[0, 2^{N-1}-1] \; and \; [-2^{N-1}, -1]$
   * 2's Complement: the binary representation for $-K$ is the binary representation for $2^{N} - K$, given the total word size $N$. In this way, the range is also $[0, 2^{N-1}-1] \; and \; [-2^{N-1}, -1]$
     * There is truncation for $2^{N} - K$ if the binary representation is beyond the word size $N$
   * Compute $-X$: then wen can compute $x - y$ by using $x + (-y)$

4. Arithmetic Logic Unit(ALU)
   * Von Neumann Architecture:
   ![](/images/Nand/VonNeumann.png)
   * The ALU computes a function on two inputs, and outputs the result. The function includes a family of pre-defined arithmetic and logical functions.
   * The Hack ALU:
     * Two 16-bit, 2's complement inputs, one 16-bit, 2's complement output
     * One function selected using 6 1-bit inputs from a 18-function family. The 6 1-bit inputs are:
         * `zx`: if `zx = 1`, then `x = 0`
         * `nx`: if `nx = 1`, then `x = !x`
         * `zy`: if `zy = 1`, then `y = 0`
         * `ny`: if `ny = 1`, then `y = !y`
         * `f`: if `f = 1`, then `out = x + y`, if `f = 0`, then `out = x & y`
         * `no`: if `no = 1`, then `out = !out`
   
   
   ![](/images/Nand/ALUFunction.png)
     * Also two 1-bit outputs:
       * `zr`: if `out == 0`, then `zr = 1`, else `zr = 0` (You can check `out[k] == 0` for every k using `OR`)
       * `ng`: if `out < 0`, then `ng = 1`, else `ng = 0`  (You can check if  `out[MSB] == 1`)
    * The hack ALU is simple, elegant and easy to implement
  
  5. Project 2
      ![](/images/Nand/Project2.png)






# Week 3

1. Sequential Logic
   * Combinatorial logic ignores time, everything happens immediate at the same time
   * Use integer time unit to represent the pass of time, each time unit has its own input and output
   * Ideally, the input occurs at the beginning of each unit, the output occurs at the ending of each unit, both instantaneously. However, there are some delays in reality(time for voltage changes, time for gate delay itself, etc.), it's quite necessary that the integer time unit is set a little bit wider to take the delays into consideration.
   * Mathematical representation:
     * Combinatorial logic: $\; out[t] = function(in[t])$
     * Sequential logic: $\; out[t] = function(in[t - 1])$, since there is a delay from input to output, then we can simply use one variable called state instead, i.e., $\; state[t] = function(state[t - 1])$


2. Flip Flops
   * Gates that can flip between states are called flip flops(触发器)
   * The Clocked Data Flip Flop:
     * `out[t] = in[t - 1]` 
     * It's primitive for this course, but actually it can be built from the `Nand` chip
     * Sequential logic implementation:
        ![](/images/Nand/SequentialLogicImplementation.png)
   * 1-big Register: remembers an input forever until requested to load a new value
     * If the load bit exists, outputs last input, if the load bit perishes, outputs last output
     * Use a `Mux` and a `DFF to construct the 1-bit register

3. Memory Units
   * Categories:
     * Main memory: RAM, ...
     * Secondary memory: disks, ...
     * Volatile/non-volatile memory: whether the stored data persists when the electricity power is cut off. RAM is volatile and disk is non-volatile.
     
   * The most basic memory element: Register:
     * Put multiple 1-bit register together to form a multi-bit register, the word size may be 16-bit, 32-bit, 64-bit
     * State: the value that is currently stored in the register
     * From the output of the register, one can know the state of the register:
         ```
         To set register state = v:
         set in[t] = v,
         set load[t] = 1.
      
         Then,
         state[t + k] = v, 
         out[t + k] = v, for any k unless a new load is set to 1.
         ```
    
   * RAM unit:
     * RAM Unit:
      ![](/images/Nand/RAMUnit.png)
     * RAM(random access memory): irrespective of the RAM size, every register can be accessed at the same instantaneous time
     * RAM abstraction: a sequence of n addressable registers, with addresses 0 to n-1
     * At any given point of time, only one register is the RAM is selected
     * Width of address input k: $k = log_2n$. Though I think $k = [log_2n] + 1$ here is better.
     * Width of word: No impact on the RAM logic. For Hack computer, $w = 16$.
     * RAM is a sequential chip, with a clocked behavior
     
   * Steps for RAM Read Logic:
     * Set `address = k`
     * Read the out of the register unit, then we can know the state of the selected kth register
     
   * Steps for RAM Write Logic:
     * Set `address = k`
     * Set `in = v`
     * Set `load = 1`
     * The the state of the register becomes v and from the next cycle onward, `out = v` for the RAM unit
     
   * A family of 16-bit RAM chips:
    
       | chip name |   n   |  k   |
       | :-------: | :---: | :--: |
       |   RAM8    |   8   |  3   |
       |   RAM64   |  64   |  6   |
       |  RAM512   |  512  |  9   |
       |   RAM4K   | 4096  |  12  |
       |  RAM16K   | 16384 |  14  |
   
4. Counters
   * The computer must keep track of which instruction should be fetched and executed next, this control mechanism can be realized using a program counter. The PC contains the address of the instruction that will be fetched and executed next.
   * Three possible control settings:
     * Reset: fetch the first instruction `PC = 0`
     * Next: fetch the next instruction `PC++`
     * Goto: fetch instruction n
   * Counter abstraction:
      * Program Counter:
      ![](/images/Nand/ProgramCounter.png)
      * If `reset[t] == 1`, `out[t + 1] = 0`, resets counter to 0
      * If `load[t] == 1`, `out[t + 1] = in[t]`, sets counter = value
      * If `inc[t] == 1`, `out[t + 1] = out[t] + 1`, increments counter by 1
      * Else `out[t + 1] = out[t]`, nothing changes

5. Project 3
   ![](/images/Nand/Project3.png)
   