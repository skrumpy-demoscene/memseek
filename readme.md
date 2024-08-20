# memseek

A simple utility to find all the empty blocks of memory within the Spectrum.

It starts at ```$6000``` (```24576```) and works up to the top of RAM, printing out the address of each block that has 16 or more continuous empty bytes.

## Usage

It will run anywhere, but I recommend loading it in at ```$5a00``` (```23040```) - the lowest third of the screen attributes - as it is then unlikely to interfere with the results and will disappear as soon as you clear the screen.

Once you have your program in memory, and you're looking for a gap to squeeze in another util, run something like the following one-liner (after inserting the tape) to get your list of spaces. Add a ```COPY``` at the end to create a printout.

```CLS : LOAD "" CODE 23040 : RANDOMIZE USR 23040 : PAUSE 0 ```
