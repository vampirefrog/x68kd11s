ECHO OFF
IF %1 == OK GOTO INS2
IF %1 == ok GOTO INS2
CLS
ECHO ***** ���݂̃h���C�u�� *****
ECHO  
DRIVE
ECHO  
ECHO ��[38m�h���C�u�����̂悤�ɂȂ��Ă��邩�m�F���Ă�������[m
ECHO       
ECHO A: �Q�g�c�i�P�l�a�j
ECHO B: �Q�g�c�i�P�l�a�j
ECHO C: �n�[�h�f�B�X�N
ECHO         �F  
ECHO         �F
ECHO    
ECHO [27;50H[36m�����~����ꍇ�͍����[BREAK]�L�[�������A
ECHO [28;50H�@����[Y]�L�[�������Ă�������[m[27;1H 
PAUSE ����������΁A�����L�[�������Ă������� 
CLS
ECHO [2;1H��[38m���̂悤�ɁA�t���b�s�[�f�B�X�N���Z�b�g���Ă�������[m
ECHO [5;1H  A:�V�X�e���f�B�X�N �� ���ɓ����Ă���͂��ł�
ECHO [6;1H  B:�����f�B�X�N      
ECHO  
ECHO [27;50H[36m�����~����ꍇ�͍����[BREAK]�L�[�������A
ECHO [28;50H�@����[Y]�L�[�������Ă�������[m[27;1H 
PAUSE ���R�s�[���n�߂܂��A�����L�[�������Ă������� 
IF EXIST C:\CONFIG.SYS GOTO INS1
:CP
CLS
ECHO ***** �R�s�[���ł� *****
VOL C:Human68k_Ver3/S
COPYALL A:\*.* C:\ /t /s
COPY A:\ETC\CONFIG.HD C:\CONFIG.SYS
COPY A:\ETC\AUTOEXEC.HD C:\AUTOEXEC.BAT
MD C:\DIC
COPY B: C:\DIC
ECHO ***** �R�s�[���I�����܂��� *****
SWITCH BOOT=SCSI0
ECHO �@ 
ECHO [46m�� ���� [m
ECHO �n�[�h�f�B�X�N����N������悤�ɂ��܂����D
ECHO �t���b�s�[�f�B�X�N����͋N���ł��܂���D
ECHO [36m�t���b�s�[�f�B�X�N����N���������ꍇ�́A[OPT.1]�L�[�������Ȃ���d���X�C�b�`��
ECHO ����Ă��������D[m
ECHO �N�����u���t���b�s�[�f�B�X�N�ɖ߂��ɂ� SWITCH ���߂��g���āA�L�[���[�h"BOOT"
ECHO ��"SCSI0" ����"STD" �ɕύX���Ă��������D
ECHO �@
GOTO END
:INS1
CLS
ECHO  
ECHO ���łɃV�X�e�����C���X�g�[������Ă���悤�ł�.
ECHO �V�����V�X�e�����C���X�g�[�����邽�߂ɁA�Â��V�X�e�����������܂�.
ECHO COMMAND.X �� HUMAN.SYS �̒���̗̈�ɂ��邱�Ƃ��m�F���Ă�������.
ECHO �@
ECHO CHKDSK C: /A�bMORE �Ɠ��͂���
ECHO �@ 
ECHO         A--S--  HUMAN.SYS     $000000B5�`$000000EE
ECHO         A-----  COMMAND.X     $000000EF�`$0000010A
ECHO         �F  
ECHO         �F
ECHO         �F  
ECHO         �F
ECHO �@
ECHO ��L�̂悤�ɗ̈悪�A�����Ă��邱�Ƃ��m�F���Ă�������.
ECHO �A�����Ă��Ȃ����́A�n�[�h�f�B�X�N�̏��������K�v�ƂȂ�܂�.
ECHO �̈悪�A�����Ă���Ȃ�A
ECHO �@
ECHO INSTALL OK �Ɠ��͂��Ă�������.
ECHO �@
TEMP C:
GOTO END
:INS2
CLS
ECHO �@
ECHO ��[38m�Â��V�X�e�����������ăC���X�g�[�����܂��B[m
ECHO �@
ECHO �@
ECHO [46m�� ���� ��
ECHO COMMAND.X �� HUMAN.SYS �̒���̗̈�ɂ���܂������H[m
ECHO [27;50H[36m�����~����ꍇ�͍����[BREAK]�L�[�������A
ECHO [28;50H�@����[Y]�L�[�������Ă�������[m[27;1H 
PAUSE ����Ƃ��n�߂܂��A�����L�[�������Ă�������
ATTRIB -S C:\HUMAN.SYS
COPY C:\HUMAN.SYS C:\HUMAN.OLD
COPY C:\COMMAND.X C:\COMMAND.OLD
DEL C:\COMMAND.X
SYS C:
IF NOT EXITCODE 0 GOTO BAD
COPY A:\COMMAND.X C:\
GOTO CP
:BAD
CLS
ECHO �@
ECHO HUMAN.SYS ���A���̈�ɃR�s�[����܂���ł���.
ECHO �n�[�h�f�B�X�N����V�X�e�����N���ł��܂���̂ŁA
ECHO �t���b�s�[�f�B�X�N����N�����A�n�[�h�f�B�X�N�t�@�C����
ECHO �o�b�N�A�b�v��A�n�[�h�f�B�X�N�̏��������s���A
ECHO �C���X�g�[�����Ă�������.
SWITCH BOOT=STD
:END
