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

.section .text
    .global __start

__start:
    # Вывод строки "A > "
    li a0, 4
    la a1, a
    ecall
    
    # Ввод int
    li a0, 5
    ecall
    
    # A в t1
    mv t1, a0
    
    # Вывод строки "X = "
    li a0, 4
    la a1, x
    ecall
    
    # Ввод int
    li a0, 5
    ecall
    
    # X в t2
    mv t2, a0
    
    # Индекс
    li t0, 0

loop:
    # Вывод X = значение
    li a0, 4
    la a1, x
    ecall
    
    li a0, 1
    mv a1, t2
    ecall
    
    # Если X меньше или равно 4, то метка smaller_or_equals
    li t5, 4
    ble t2, t5, smaller_or_equals  # Если X <= 4 то метка smaller_or_equals 
 
continue:
    li t5, 4
    # Если X больше 4, то метка bigger_than_four
    bgt t2, t5, bigger_than_four

smaller_or_equals:   
    # Y1 = 4*X
    li t5, 4
    mul s2, t2, t5
    j not_even
    
bigger_than_four:
    # Y1 = X - A
    sub s2, t2, t1
    j not_even

not_even:  
    # Y2 = 7 если X нечетное
    li t5, 1          
    and t5, t2, t5    
    beqz t5, even  
    
    # X - нечетное
    li s3, 7
    j print_result

even:
    # X - четное
    # X - нечетное
    srai s3, t2, 1     # Y2 = (X / 2)
    add s3, s3, t1     # Прибавление значения A

print_result:
    # Вывод строки ", Y1 = "
    li a0, 4
    la a1, y1
    ecall
    
    # Вывод Y1
    li a0, 1
    mv a1, s2
    ecall
    
    # Вывод строки ", Y2 = "
    li a0, 4
    la a1, y2
    ecall
    
    # Вывод Y2
    li a0, 1
    mv a1, s3
    ecall
    
    # Вывод строки ", Y = "
    li a0, 4
    la a1, y
    ecall
    
    # Остаток от деления Y1 на Y2 и сохранение в Y
    add s4, s2, s3
    
    # Вывод Y
    li a0, 1
    mv a1, s4
    ecall
    
    # Вывод строки "\n"
    li a0, 4
    la a1, new_line
    ecall
    
    # Увеличение X на 1
    addi t2, t2, 1
    # Положить 9 в t4
    li t4, 9
    # Увеличение индекса
    addi t0, t0, 1
    # Если индекс не равен 9, переход на loop
    bne t0, t4, loop
    
    # Завершение программы
    li a0, 10
