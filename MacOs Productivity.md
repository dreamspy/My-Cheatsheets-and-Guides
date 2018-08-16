# MacOS ZSH Commands Cheat Sheet
*Depends on oh-my-zsh and some plugins*

## Miscellaneous commands

Command | Description |
---|---|
tree | Show a graphical tree of current dir

## Standard Aliases

shell command         | Description |
--------------------|------------------|
**d**	| **directory history**
/ | cd /
~ | cd ~
... | cd ../..
.... | cd ../../..
..... | cd ../../../.. I think you get it, right?
take test_folder | Creates a folder named test_folder and changes to it
x | Extract archive of types tar, bz2, rar, gz, tbz2, tgz, zip, Z, 7z
upgrade\_oh\_my\_zsh | Easy commando for upgrading your installation

## osx plugin
Command |Description
---|---|
tab |Open the current directory in a new tab
split_tab|	Split the current terminal tab horizontally
vsplit_tab|	Split the current terminal tab vertically
ofd|			Open the current directory in a Finder window
pfd	|		Return the path of the frontmost Finder window
pfs	|		Return the current Finder selection
cdf	|		cd to the current Finder directory
pushdf|		pushd to the current Finder directory
quick-look|	Quick-Look a specified file
man-preview|	Open a specified man page in Preview app
showfiles	|Show hidden files
hidefiles|	Hide the hidden files
itunes		|Control iTunes. User itunes -h for usage details
spotify	|	Control Spotify and search by artist, album, track and etc.
		
## common-alises plugin
Command | Description
---|---|
l	|ls -lFh
la	|ls -lAFh
lr	|ls -tRFh
lt	|ls -ltFh
ll	|ls -l
ldot|	ls -ld .*
lS	|ls -1FSsh
lart|	ls -1Fcart
lrt	|ls -1Fcrt
zshrc	|$EDITOR ~/.zshrc
h	|history
p	|(processes for current user)

Alias to place at the end of command:

Alias	| Command
---|---|
H	| head
T	| tail
G	| grep
L	| less
M	| most
LL	|2>&1  less
CA	|2>&1  cat -A
NE	|2> /dev/null
NUL	| > /dev/null 2>&1
P|	2>&1| pygmentize -l pytb

## vi-mode plugin

Use ESC or CTRL-[ to enter Normal mode.

### History
Command | Description|
---|---|
ctrl-p | Previous command in history
ctrl-n | Next command in history
/ | Search backward in history
n | Repeat the last /

### Mode indicators

Normal mode is indicated with red <<< mark at the right prompt, when it wasn't defined by theme.

### Vim edition

Command | Description|
---|---|
v | Edit current command line in Vim

### Movement

Command | Description|
---|---|
$ || To the end of the line
^ | To the first non-blank character of the line
0 | To the first character of the line
w | [count] words forward
W | [count] WORDS forward
e | Forward to the end of word [count] inclusive
E | Forward to the end of WORD [count] inclusive
b | [count] words backward
B | [count] WORDS backward
t{char} | Till before [count]'th occurrence of {char} to the right
T{char} | Till before [count]'th occurrence of {char} to the left
f{char} | To [count]'th occurrence of {char} to the right
F{char} | To [count]'th occurrence of {char} to the left
; | Repeat latest f, t, F or T [count] times
, | Repeat latest f, t, F or T in opposite direction

### Insertion
Command | Description|
---|---|
i | Insert text before the cursor
I | Insert text before the first character in the line
a | Append text after the cursor
A | Append text at the end of the line
o | Insert new command line below the current one
O | Insert new command line above the current one

### Delete and Insert
Command | Description|
---|---|
ctrl-h | While in Insert mode: delete character before the cursor
ctrl|-w | While in Insert mode: delete word before the cursor
d{motion} | Delete text that {motion} moves over
dd | Delete line
D | Delete characters under the cursor until the end of the line
c{motion} | Delete {motion} text and start insert
cc | Delete line and start insert
C | Delete to the end of the line and start insert
r{char} | Replace the character under the cursor with {char}
R | Enter replace mode: Each character replaces existing one
x | Delete [count] characters under and after the cursor
X | Delete [count] characters before the cursor
