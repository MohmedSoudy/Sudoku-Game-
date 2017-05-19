include irvine32.inc
.data
file1 byte "diff_1_1.txt",0
solvedfile1 byte "diff_1_1_solved.txt",0
file2 byte "diff_1_2.txt",0
solvedfile2 byte "diff_1_2_solved.txt",0
file3 byte "diff_1_3.txt",0
solvedfile3 byte "diff_1_3_solved.txt",0
file4 byte "diff_2_1.txt",0
solvedfile4 byte "diff_2_1_solved.txt",0
file5 byte "diff_2_2.txt",0
solvedfile5 byte "diff_2_2_solved.txt",0
file6 byte "diff_2_3.txt",0
solvedfile6 byte "diff_2_3_solved.txt",0
file7 byte "diff_3_1.txt",0
solvedfile7 byte "diff_3_1_solved.txt",0
file8 byte "diff_3_2.txt",0
solvedfile8 byte "diff_3_2_solved.txt",0
file9 byte "diff_3_3.txt",0
solvedfile9 byte "diff_3_3_solved.txt",0

filehandle dword ?
BUFSIZE = 100
buffer byte BUFSIZE dup (?)
buffersolved byte BUFSIZE dup (?)
arr dword 500 dup (?)


;RandomNumber_Easy PROTO file1:PTR BYTE ,  file2:PTR BYTE , file3:PTR BYTE, Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
;RandomNumber_Medium PROTO file4:PTR BYTE ,  file5:PTR BYTE , file6:PTR BYTE, Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
;RandomNumber_Hard PROTO file7:PTR BYTE ,  file8:PTR BYTE , file9:PTR BYTE, Unsolved:ptr dword, unsize:DWORD, Solved:ptr dword, Size1:DWORD
;init_unsolved PROTO Unsolved:ptr dword, Size:DWORD
;init_solved PROTO Solved:ptr dword, Size1:DWORD
.code
Easy1 PROC  Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
pushad
Invoke RandomNumber_Easy, offset file1 , offset file2 , offset file3, Unsolved, Size, Solved, Size1
popad
Ret
Easy1 ENDP

Medium PROC  Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
pushad
invoke RandomNumber_Medium , offset file4,offset file5,offset file6,  Unsolved, Size,  Solved, Size1
popad
RET
Medium ENDP

Hard PROC  Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
pushad
invoke RandomNumber_Hard, offset file7,offset file8,offset file9,  Unsolved, Size,  Solved, Size1
popad
RET
Hard ENDP

RandomNumber_Easy PROC  Easy1_offset: PTR BYTE , Easy2_offset:PTR BYTE , Easy3_offset:PTR BYTE, unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
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
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile1
invoke init_solved, Solved, Size1
popad
Jmp Next
Load2:
pushad
mov edx , Easy2_offset
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile2
invoke init_solved, Solved, Size1
popad
Jmp Next
Load3:
pushad
mov edx , Easy3_offset
invoke init_unsolved, Unsolved, Size
popad
;call init_unsolved
pushad
mov edx,offset solvedfile3
invoke init_solved, Solved, Size1
popad
Jmp Next
Next:
    ret
RandomNumber_Easy ENDP


RandomNumber_Medium PROC  Medium1_offset: PTR BYTE , Medium2_offset:PTR BYTE , Medium3_offset:PTR BYTE, Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
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
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile4
invoke init_solved, Solved, Size1
popad
Jmp Next
Load2:
pushad
mov edx , Medium2_offset
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile5
invoke init_solved, Solved, Size1
popad
Jmp Next
Load3:
pushad
mov edx , Medium3_offset
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile6
invoke init_solved, Solved, Size1
popad
Jmp Next
Next:
    ret
RandomNumber_Medium ENDP

RandomNumber_Hard PROC  Hard1_offset: PTR BYTE , Hard2_offset:PTR BYTE , Hard3_offset:PTR BYTE, Unsolved:ptr dword, Size:DWORD, Solved:ptr dword, Size1:DWORD
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
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile7
invoke init_solved, Solved, Size1
popad
Jmp Next
Load2:
pushad
mov edx , Hard2_offset
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile8
invoke init_solved, Solved, Size1
popad
Jmp Next
Load3:
pushad
mov edx , Hard3_offset
invoke init_unsolved, Unsolved, Size
popad
pushad
mov edx,offset solvedfile9
invoke init_solved, Solved, Size1
popad
Jmp Next
Next:
    ret
RandomNumber_Hard ENDP


init_unsolved PROC Unsolved:ptr dword, Size:DWORD
call OpenInputFile
mov filehandle, eax
mov edx, offset buffer
mov ecx, BUFSIZE
call ReadFromFile
mov esi, offset buffer
mov edi, Unsolved
mov ecx, 9
mov eax ,0
outerloop:
	push ecx
	mov ecx, 9
	innerloop:
		cmp byte ptr [esi], '0'
		jne notzero
		mov byte ptr [edi], ' '
		jmp next1
		notzero: mov bl, [esi]
				mov byte ptr [edi], bl
		next1: 
		inc esi
			  inc edi
		loop innerloop
	pop ecx
	add esi, 2
	loop outerloop
mov eax, filehandle
call CloseFile
RET
init_unsolved ENDP

init_solved PROC  Solved:ptr dword, Size1:DWORD
; Fill Solved Matrix
call OpenInputFile
mov filehandle, eax
mov edx, offset buffersolved
mov ecx, BUFSIZE
call ReadFromFile
mov esi, offset buffersolved
mov edi, Solved
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