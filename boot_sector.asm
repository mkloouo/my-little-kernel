;; Simple boot sector
[org 0x7c00]	
	mov bx, HELLO_MSG
	call print_string

	mov al, ' '
	call print_char
	
	mov bx, BYE_MSG
	call print_string

	mov al, ' '
	call print_char

	mov dx, 0x1fbe
	call print_hex
	
	jmp $

%include "print.asm"

BYE_MSG:
	db 'Goodbye.', 0
HELLO_MSG:
	db 'Hello!', 0
	
	times 510-($-$$) db 0
	dw 0xaa55
