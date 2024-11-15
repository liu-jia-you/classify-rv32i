.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)

    li t1, 0
    li t2, 1
loop_start:
    li t3, 0

loop:
    beq t1, a1, end
    slli t4, t1, 2
    add t4, t4, a0
    lw t5, 0(t4)
    
    ble t5, t0, go_loop
    mv t0, t5 
    mv t3, t1 
    
go_loop:
    addi t1, t1, 1
    j loop

end:
    mv a0, t3 
    jr ra
    
handle_error:
    li a0, 36
    j exit
