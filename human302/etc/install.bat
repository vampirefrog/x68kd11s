ECHO OFF
IF %1 == OK GOTO INS2
IF %1 == ok GOTO INS2
CLS
ECHO ***** 現在のドライブ状況 *****
ECHO  
DRIVE
ECHO  
ECHO ＞[38mドライブが下のようになっているか確認してください[m
ECHO       
ECHO A: ２ＨＤ（１ＭＢ）
ECHO B: ２ＨＤ（１ＭＢ）
ECHO C: ハードディスク
ECHO         ：  
ECHO         ：
ECHO    
ECHO [27;50H[36m※中止する場合は左上の[BREAK]キーを押し、
ECHO [28;50H　次に[Y]キーを押してください[m[27;1H 
PAUSE ＞正しければ、何かキーを押してください 
CLS
ECHO [2;1H＞[38m次のように、フロッピーディスクをセットしてください[m
ECHO [5;1H  A:システムディスク ← 既に入っているはずです
ECHO [6;1H  B:辞書ディスク      
ECHO  
ECHO [27;50H[36m※中止する場合は左上の[BREAK]キーを押し、
ECHO [28;50H　次に[Y]キーを押してください[m[27;1H 
PAUSE ＞コピーを始めます、何かキーを押してください 
IF EXIST C:\CONFIG.SYS GOTO INS1
:CP
CLS
ECHO ***** コピー中です *****
VOL C:Human68k_Ver3/S
COPYALL A:\*.* C:\ /t /s
COPY A:\ETC\CONFIG.HD C:\CONFIG.SYS
COPY A:\ETC\AUTOEXEC.HD C:\AUTOEXEC.BAT
MD C:\DIC
COPY B: C:\DIC
ECHO ***** コピーを終了しました *****
SWITCH BOOT=SCSI0
ECHO 　 
ECHO [46m※ 注意 [m
ECHO ハードディスクから起動するようにしました．
ECHO フロッピーディスクからは起動できません．
ECHO [36mフロッピーディスクから起動したい場合は、[OPT.1]キーを押しながら電源スイッチを
ECHO 入れてください．[m
ECHO 起動装置をフロッピーディスクに戻すには SWITCH 命令を使って、キーワード"BOOT"
ECHO を"SCSI0" から"STD" に変更してください．
ECHO 　
GOTO END
:INS1
CLS
ECHO  
ECHO すでにシステムがインストールされているようです.
ECHO 新しいシステムをインストールするために、古いシステムを消去します.
ECHO COMMAND.X が HUMAN.SYS の直後の領域にあることを確認してください.
ECHO 　
ECHO CHKDSK C: /A｜MORE と入力して
ECHO 　 
ECHO         A--S--  HUMAN.SYS     $000000B5〜$000000EE
ECHO         A-----  COMMAND.X     $000000EF〜$0000010A
ECHO         ：  
ECHO         ：
ECHO         ：  
ECHO         ：
ECHO 　
ECHO 上記のように領域が連続していることを確認してください.
ECHO 連続していない時は、ハードディスクの初期化が必要となります.
ECHO 領域が連続しているなら、
ECHO 　
ECHO INSTALL OK と入力してください.
ECHO 　
TEMP C:
GOTO END
:INS2
CLS
ECHO 　
ECHO ＞[38m古いシステムを消去してインストールします。[m
ECHO 　
ECHO 　
ECHO [46m※ 注意 ※
ECHO COMMAND.X は HUMAN.SYS の直後の領域にありましたか？[m
ECHO [27;50H[36m※中止する場合は左上の[BREAK]キーを押し、
ECHO [28;50H　次に[Y]キーを押してください[m[27;1H 
PAUSE ＞作業を始めます、何かキーを押してください
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
ECHO 　
ECHO HUMAN.SYS が連続領域にコピーされませんでした.
ECHO ハードディスクからシステムを起動できませんので、
ECHO フロッピーディスクから起動し、ハードディスクファイルの
ECHO バックアップ後、ハードディスクの初期化を行い、
ECHO インストールしてください.
SWITCH BOOT=STD
:END
