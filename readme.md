# memseek

A simple utility to find all the empty blocks of memory within the Spectrum.

It starts at ```$6000``` (```24576```) and works up to the top of RAM, printing out the address of each block that has 16 or more continuous empty bytes.

It will run anywhere, but I recommend loading it in at ```$5a00``` (```23040```) - the lowest third of the screen attributes) as it is then unlikely to interfere with the results and will disappear as soon as you clear the screen.
