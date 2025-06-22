.section .text
.globl _start

_start:

    la a0, num               # Load address of num
    lw a0, 0(a0)             # Load value into a0

    jal ra, factorial        # Call factorial(a0)

    la t0, result            # Store result into memory
    sw a0, 0(t0)

    j write_tohost           

# Recursive factorial 
factorial:
    addi sp, sp, -8          # Allocate 8 bytes on stack
    sw ra, 4(sp)             # Save return address
    sw a0, 0(sp)             # Save argument n

    li t0, 1
    ble a0, t0, base_case    # if n <= 1, return 1

    addi a0, a0, -1
    jal ra, factorial        # a0 = factorial(n-1)

    lw t1, 0(sp)             # Restore n
    mul a0, a0, t1           # a0 = n * factorial(n-1)

    lw ra, 4(sp)             # Restore ra
    addi sp, sp, 8           # Deallocate stack
    jr ra

base_case:
    li a0, 1
    lw ra, 4(sp)
    addi sp, sp, 8
    jr ra

write_tohost:
    li a1, 1
    la t0, tohost
    sw a1, 0(t0)
    j write_tohost

.section .data
num:    .word 5              # Input number
result: .word 0              # Output result

.align 12
.section .tohost, "aw", @progbits
.align 4
.global tohost
tohost: .word 0             

.align 4
.global fromhost
fromhost: .word 0
