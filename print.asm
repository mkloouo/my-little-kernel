print_char:
	push ax
	
	mov ah, 0x0e
	int 0x10
	
	pop ax
	ret

print_string:
	pusha
	
print_string_lp:
	mov cl, [bx]
	cmp cl, 0
	je print_string_end
	
	mov al, [bx]
	call print_char

	add bx, 1
	jmp print_string_lp
	
print_string_end:
	popa	
	ret

print_string_nl:
	push ax

	call print_string
	mov al, 0xA
	call print_char
	
	pop ax
	ret

print_hex:
	pusha

	mov bx, .hex_suffix
	call print_string

print_hex_lp:
	

print_hex_end:	
	popa
	ret

.hex_suffix:
	db '0x', 0
