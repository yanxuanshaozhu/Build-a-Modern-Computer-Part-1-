<p style="text-align:left; font-weight:bold;">Build a Modern Computer from First Principles: From Nand to Tetris (Project-Centered Course)</p>
<a style="text-align:left; font-weight:bold;" href = "https://www.coursera.org/learn/build-a-computer"> Course Website</a>
<p style="text-align:left; font-weight:bold;">Book: The Elements for Computing Systems--Build a Modern Computer from First Principles</p>

<!-- more -->



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
   1. Boolean operations:
      * `(x AND y)` or x $\land$ y 
      * `(x OR y)` or x $\lor$  y 
      * `NOT(x)` or $\neg$ x 
   1. Boolean Functions
      * Example: `f(x, y, z) = (x AND y) OR (NOT(X) AND z)`
      * You can also use a truth table to describe a function apart from a formula
   3. Boolean Identities:
      * `(x AND y) = (y AND x)`   this is a commutative law
      * `(x AND (y AND z)) = ((x AND y) AND z)` this is an associative law
      * `(x AND (y OR z)) = (x AND y) OR (x AND z)` this is a distributive law
      * `NOT(x AND y) = NOT(x) OR NOT(y)` this is a De Morgan Law

   2. Boolean Function Synthesis:
      * It's easy to draw a truth table from a boolean function, but the reverse process is actually what a computer does
      * The way converting a truth table into a boolean function is called constructing a disjunctive normal form
      * Steps:
         * Find a function for each row with a value 1, the function should take 1 for the current row and 0 for all other rows
         * Use `OR` to combine the all found functions
         * Reduce the combined function to one simple function
      * Theorem: Any boolean function can be represented using an expression containing `AND`, and `NOT` operations.
         
         `OR` can be replaced with `AND` and `NOT` using De Morgan Law
      * Nand function: `(x NAND y) = NOT(x AND y)`
      * Truth table for Nand:
      
      | x   |   y   | NAND |
      | --- | :---: | ---: |
      | 0   |   0   |    1 |
      | 0   |   1   |    1 |
      | 1   |   0   |    1 |
      | 1   |   1   |    0 |
      * Theorem: Any boolean function can be represented using only `NAND` operations.

         Proof:

         `NOT(x) = (x NAND x)`
         
         `(x AND y) = NOT(x NAND y)`

         Since `AND` and `NOT` can be represented by `NAND`, according to the previous theorem, any boolean functions then can be represented using `NAND`