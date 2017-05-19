




include irvine32.inc
.data
file1 byte "Sudoku Boards\diff_1_1.txt",0
file2 byte "Sudoku Boards\diff_1_2.txt",0
file3 byte "Sudoku Boards\diff_1_3.txt",0
file4 byte "Sudoku Boards\diff_2_1.txt",0
file5 byte "Sudoku Boards\diff_2_2.txt",0
file6 byte "Sudoku Boards\diff_2_3.txt",0
file7 byte "Sudoku Boards\diff_3_1.txt",0
file8 byte "Sudoku Boards\diff_3_2.txt",0
file9 byte "Sudoku Boards\diff_3_3.txt",0

solvedfile1 byte "Sudoku Boards\diff_1_1_solved.txt",0
solvedfile2 byte "Sudoku Boards\diff_1_2_solved.txt",0
solvedfile3 byte "Sudoku Boards\diff_1_3_solved.txt",0
solvedfile4 byte "Sudoku Boards\diff_2_1_solved.txt",0
solvedfile5 byte "Sudoku Boards\diff_2_2_solved.txt",0
solvedfile6 byte "Sudoku Boards\diff_2_3_solved.txt",0
solvedfile7 byte "Sudoku Boards\diff_3_1_solved.txt",0
solvedfile8 byte "Sudoku Boards\diff_3_2_solved.txt",0
solvedfile9 byte "Sudoku Boards\diff_3_3_solved.txt",0

filehandle dword ?
BUFSIZE = 100
buffer byte BUFSIZE dup (?)
buffersolved byte BUFSIZE dup (?)
;unsolved byte 81 dup (?)
;solved byte 81 dup (?)
arr dword 500 dup (?)

.code
RandomNumber_Easy PROTO file1:PTR BYTE ,  file2:PTR BYTE , file3:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
RandomNumber_Medium PROTO file4:PTR BYTE ,  file5:PTR BYTE , file6:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
RandomNumber_Hard PROTO file7:PTR BYTE ,  file8:PTR BYTE , file9:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
init_unsolved PROTO unsolved:ptr dword, unsize:DWORD
init_solved PROTO solved:ptr dword, ssize:DWORD

getEasy PROC  unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
pushad
invoke RandomNumber_Easy, offset file1 , offset file2 , offset file3, unsolved, unsize, solved, ssize
popad
RET
getEasy ENDP

getMed PROC  unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
pushad
invoke RandomNumber_Medium , offset file4,offset file5,offset file6,  unsolved, unsize,  solved, ssize
popad
RET
getMed ENDP

getHard PROC  unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
pushad
invoke RandomNumber_Hard, offset file7,offset file8,offset file9,  unsolved, unsize,  solved, ssize
popad
RET
getHard ENDP

RandomNumber_Easy PROC  Easy1_offset: PTR BYTE , Easy2_offset:PTR BYTE , Easy3_offset:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
call Randomize               ;Sets seed
mov  eax,3                  ;Keeps the range 0 - 2
mov ebx , eax 
call RandomRange
mov ebx , eax 
Cmp eax , 0            ;First random number
Je Load1
Cmp eax , 1
Je Load2
Cmp eax , 2
Je Load3
Load1:
pushad
mov edx , Easy1_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile1
invoke init_solved, solved, ssize
popad
;call init_solved
Jmp Next
Load2:
pushad
mov edx , Easy2_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile2
invoke init_solved, solved, ssize
popad
;call init_solved
Jmp Next
Load3:
pushad
mov edx , Easy3_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile3
invoke init_solved, solved, ssize
popad
;call init_solved
Jmp Next
Next:
    ret
RandomNumber_Easy ENDP


;------------------------------------------------;
;Medium Levels		   							 ;
;												 ;
;												 ;
;------------------------------------------------;

RandomNumber_Medium PROC  Medium1_offset: PTR BYTE , Medium2_offset:PTR BYTE , Medium3_offset:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
call Randomize
mov  eax,3                  ;Keeps the range 0 - 2
mov ebx , eax 
call RandomRange
mov ebx , eax
Cmp eax , 0            ;First random number
Je Load1
Cmp eax , 1
Je Load2
Cmp eax , 2
Je Load3
Load1:
pushad
mov edx , Medium1_offset 
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile4
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Load2:
pushad
mov edx , Medium2_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile5
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Load3:
pushad
mov edx , Medium3_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile6
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Next:
    ret
RandomNumber_Medium ENDP

;------------------------------------------------;
;Hard Levels	    							 ;
;												 ;
;												 ;
;------------------------------------------------;

RandomNumber_Hard PROC  Hard1_offset: PTR BYTE , Hard2_offset:PTR BYTE , Hard3_offset:PTR BYTE, unsolved:ptr dword, unsize:DWORD, solved:ptr dword, ssize:DWORD
call Randomize
mov  eax,3                  ;Keeps the range 0 - 2
mov ebx , eax 
call RandomRange
mov ebx , eax 
Cmp eax , 0            ;First random number
Je Load1
Cmp eax , 1
Je Load2
Cmp eax , 2
Je Load3
Load1:
pushad
mov edx , Hard1_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved 
pushad
mov edx,offset solvedfile7
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Load2:
pushad
mov edx , Hard2_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile8
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Load3:
pushad
mov edx , Hard3_offset
invoke init_unsolved, unsolved, unsize
popad
;call init_unsolved
pushad
mov edx,offset solvedfile9
invoke init_solved, solved, ssize
popad
;call init_solved

Jmp Next
Next:
    ret
RandomNumber_Hard ENDP


init_unsolved PROC unsolved:ptr dword, unsize:DWORD
call OpenInputFile
mov filehandle, eax
mov edx, offset buffer
mov ecx, BUFSIZE
call ReadFromFile
mov esi, offset buffer
mov edi, unsolved
mov ecx, 9
mov eax ,0
outerloop:
	push ecx
	mov ecx, 9
	innerloop:
		cmp byte ptr [esi], '0'
		jne notzero
		mov byte ptr [edi], ' '
		;inc counter
		;mov eax , 0
		;mov arr[eax] ,edi
		;add eax , 4
		jmp next1
		notzero: mov bl, [esi]
				mov byte ptr [edi], bl
		next1: inc esi
			  inc edi
		loop innerloop
	pop ecx
	add esi, 2
	loop outerloop
mov eax, filehandle
call CloseFile
RET
init_unsolved ENDP

init_solved PROC  solved:ptr dword, ssize:DWORD
; Fill Solved Matrix
call OpenInputFile
mov filehandle, eax
mov edx, offset buffersolved
mov ecx, BUFSIZE
call ReadFromFile
mov esi, offset buffersolved
mov edi, solved
mov ecx, 9
outerloop_solved:
	push ecx
	mov ecx, 9
	innerloop_solved:
		mov bl, [esi]
		mov byte ptr [edi], bl
		inc esi
		inc edi
		loop innerloop_solved
	pop ecx
	add esi, 2
	loop outerloop_solved
mov eax, filehandle
call CloseFile
RET
init_solved ENDP

; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain