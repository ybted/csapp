DATA SEGMENT
    MESG DB "This is an Assembly Language Programe.", 0DH, 0AH, "$"
    SPACE DB " ", "$"
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
        MOV AX, DATA
        MOV DS, AX              ; �� DATA �εĶ���ַ���� DS
        MOV BX, 01H             ; BX ��ʼֵ��Ϊ 1
    AGAIN:
        MOV DX, OFFSET MESG     ; ȡ����ʾ���ַ�ƫ�������� DX
        MOV AH, 09H             ; ���� 9��(��ʾ)DOS�����ӳ���
        INT 21H
        MOV CX, BX              ; �� BX ��ֵ���� CX
        INC BX
    NEXT:
        MOV DX, OFFSET SPACE    ; ȡ�ո��ַ�ƫ�������� DX
        MOV AH, 09H
        INT 21H
        LOOP NEXT               ; ������ʾ�ո��ַ���ֱ�� CX Ϊ 0
        CMP BX, 10              ; BX �� 10 �Ƚ�
        JBE AGAIN               ; û��ʾ 10 �Σ�ת�Ƶ� AGAIN ����ִ�г���
        MOV AH, 4CH
        INT 21H                 ; ���� DOS
CODE ENDS
END START