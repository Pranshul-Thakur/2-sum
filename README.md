# Two Sum in x86 Assembly

Implementation of the classic Two Sum algorithm in x86 assembly language using NASM syntax.

## Problem

Given an array of integers and a target sum, find if any two numbers add up to the target.

## Algorithm

Brute force O(n²) approach:
- Nested loops iterate through all pairs
- Checks if sum equals target
- Sets `found` flag to 1 if match exists

## Code Structure

```asm
section .data
    nums dd 3, 5, 7, 9    # Array of integers
    n equ 4                # Array size
    target dd 12           # Target sum
    found dd 0             # Result flag

section .text
    outer_loop:            # Loop through first element
    inner_loop:            # Loop through remaining elements
    match:                 # Found matching pair
```

## Assembly

```bash
nasm -f elf32 2sum.asm -o 2sum.o
ld -m elf_i386 2sum.o -o 2sum
```

## Run

```bash
./2sum
echo $?
```

Exit code 0 indicates successful execution. Check `found` in memory to see result.

## Example

Input: `[3, 5, 7, 9]`, Target: `12`
- Checks pairs: (3,5), (3,7), (3,9), (5,7), (5,9), (7,9)
- Match found: 3 + 9 = 12
- Sets `found = 1`

## Registers Used

- `eax`: Outer loop index (i)
- `ebx`: Inner loop index (j)
- `esi`: First number
- `edi`: Second number

## Requirements

- NASM assembler
- 32-bit x86 Linux environment
- `ld` linker

## Notes

- Uses Linux syscall convention (`int 0x80`)
- 32-bit integer operations
- No bounds checking or error handling
