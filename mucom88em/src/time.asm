;==========================================================================
; MUCOM88 Extended Memory Edition (MUCOM88em)
; ファイル名 : time.asm (Z80アセンブラソース)
; 機能 : テキスト終了チェック＆タイム表示
; 更新日：2019/11/17
;==========================================================================
; ※本ソースはMUSICLALF Ver.1.0〜1.2共通のtime.asmを元に作成した物です。
;==========================================================================
	
	
	;TXTEND CHECK & TIME PRINT
	
	ORG	0E400H
	
NOTSB2:EQU	0FFF8H
TXTEND:EQU	0EB18H
S.ILVL:	EQU	0E6C3H
;TIME:	EQU	0B000H+3*17		;■変更前：演奏ルーチンのオフセット変更に伴う修正
TIME:	EQU	0C000H+3*17		;■変更後
	
	
; --	BASIC ﾉ TEXTENDﾁｪｯｸ ｦ vrtcﾜﾘｺﾐ ﾆ ｾｯﾃｲ	--
	
STTE:
	LD	HL,(0F302H)
	LD	(CHJ+1),HL
	DI
	LD	HL,CHECK
	LD	(0F302H),HL
	EI
	RET
	
; --	CHECK ﾙｰﾁﾝ(8D00Hﾍ ﾃﾝｿｳｻﾚﾙ)	--
	
CHECK:
	DI
	PUSH	AF
	PUSH	HL
	PUSH	DE
	PUSH	BC
	
	LD	HL,VRTCC
	DEC	(HL)
	JR	NZ,CH3
	LD	(HL),6
	
CH2:
	CALL	TIME
CH3:
	LD	A,(S.ILVL)
	OUT	(0E4H),A
	
	POP	BC
	POP	DE
	POP	HL
	POP	AF
	EI
CHJ:
	JP	0E808H
	
VRTCC:	DB	30
