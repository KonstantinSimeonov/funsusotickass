# Linux persmissions

## Description

Linux file permissions are in the from of `rwx` which stands for **read write execute**. The permissions for a file are represented by the 3 leftmost bits of an integer number. If a bit is `1`, then the permission is granted, if it's `0`, it's not granted. Examples:

| permission | bits | decimal integer | explanation |
|:----------:|:----:|:---------------:|:-----------:|
| rwx        | 111 :|: 7              | The user can read the file, write to it and execute it |
| r-x        | 101 :|: 5              | The user can read and execute the file, but not write to it |
| ---        | 000 :|: 0              | The user cannot read from, write to or execute the file |
| rw-        | 110 :|: 6              | The user can read from and write to the file, but not execute it |

The `-` in the permissions stands for `not granted`. The order of the persmissions is always the same - first comes `r`, then `w`, then `x`. Write a program that reads a 3 symbol permission from the standart input stream and prints the decimal integer representation of the persmission.

## Input
- The input will always be a single line with 3 symbols in the format described above

## Output
- Output a single line containing the decimal integer representation of the input permission

## Sample tests

| input | output |
|:-----:|:------:|
| rwx   | 7      |
| r-x   | 5      |
| ---   | 0      |
| -w-   | 2      |
