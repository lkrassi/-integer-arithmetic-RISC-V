# RISC-V Assembler Programm for integer operations

## Overview

This project demonstrates a simple RISC-V assembler program that performs various computations based on user input. The program prompts the user for integers and performs calculations.

## Project Structure

The project consists of two sections:
1. **.data** - This section contains the string literals used in the program.
2. **.text** - This section contains the main logic of the program.

## Data Section

The `.data` section defines several string literals that will be used for output during the execution of the program.

```assembly
.section .data
a:
    .asciiz "A > "
x:
    .asciiz "X = "
new_line:
    .asciiz "\n"
y1:
    .asciiz ", Y1 = "
y2:
    .asciiz ", Y2 = "
y:
    .asciiz ", Y = "
```

## Text Section

The .text section contains the main logic of the program. Here's a step-by-step breakdown of what the program does:

Initialize and Print Prompts:
  - Outputs the prompt "A > " and reads an integer value A.
  - Outputs the prompt "X = " and reads an integer value X.


## loop:

  - The loop continues until X has been incremented 9 times.
  - In each iteration, it performs the following steps:
    - Outputs the current value of X.
    - Depending on whether X is less than or equal to 4 or greater than 4, calculates Y1:
      - If X <= 4: Y1 = 4 * X
      - If X > 4: Y1 = X - A
    - Calculates Y2 based on whether X is even or odd:
      - If X is even: Y2 = (X / 2) + A
      - If X is odd: Y2 = 7
    - Outputs Y1, Y2, and their sum Y.
    - Increments X and repeats the loop.
   

## smaller_or_equals
- **Description**: This label handles the calculation when `X` is less than or equal to 4.

```assembly
smaller_or_equals:   
    # Y1 = 4 * X
    li t5, 4
    mul s2, t2, t5
    j not_even      # Jump to the result label
```

## bigger_than_four
- **Description**: This label handles the calculation when `X` is greater than 4.

```assembly
bigger_than_four:
    # Y1 = X - A
    sub s2, t2, t1  
    j not_even        # Jump to the result label
```

## not_even
- **Description**: This label determines if `X` is even or odd and calculates `Y2` accordingly.

```assembly
result:
    # Determine if X is even or odd
    li t5, 1        
    and t5, t2, t5   
    beqz t5, not_even # If result is zero, jump to not_even (X is even)
    
    # X is odd
    li s3, 7      
    j print_result # Jump to print_result
```

## even
- **Description**: This label handles the calculation for `Y2` when `X` is even.

```assembly
not_even:
    # X is even
    srai s3, t2, 1  
    add s3, s3, t1   
    j print_result   # Jump to print_result
```

## print_result
- **Description**: This label handles the output of the results (`Y1`, `Y2`, and `Y`) and increments `X`.



## Program Termination:
  - After completing the loop 9 times, the program terminates.


