<p style="text-align:left; font-weight:bold;">Build a Modern Computer from First Principles: From Nand to Tetris (Project-Centered Course)</p>

<a style="text-align:left; font-weight:bold;" href = "https://www.coursera.org/learn/build-a-computer"> Course Website</a>

<p style="text-align:left; font-weight:bold;">Book: The Elements for Computing Systems--Build a Modern Computer from First Principles</p>



# Week 1


1 Module 0: Introduction 

1. One only need to know about 'what' rather than 'how' to do programming.

 * 'How' is about implementation, since you're only using the computers, you don't need to duplicate it, then you don't need to know how to make it actually happen.
 * 'What' is about abstraction, you care about what your program suppose to do, i.e., what will happen for each commands you write.
 * For multiple layers of abstraction, we only care about the upmost layer interface
    ![](/images/layers.png)

2. From Nand to Hack

* The Hack Computer
    ![](/images/HackComputer.png)
* Nand is the most elementary logic gate. Other gates like combinational logic gates and sequential logic gates are built based on Nand.
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

2. Boolean Function Synthesis:

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

        | x    |  y   | NAND |
        | ---- | :--: | ---: |
        | 0    |  0   |    1 |
        | 0    |  1   |    1 |
        | 1    |  0   |    1 |
        | 1    |  1   |    0 |

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
            ![](/images/xorgate.png)
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
        ![](/image/project1gates.png)