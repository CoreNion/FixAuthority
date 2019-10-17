@echo off
rem 管理者権限か確認・そうでなければ管理者権限で再起動
set ThisPath=%~f0
openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 (
    powershell start-process %ThisPath% -verb runas
    exit
) 


echo 権限修復ツール   
echo ここでは、ファイルやフォルダーの権限を元のWindowsの権限に戻せます
echo フォルダーの場合は1を、ファイルの場合は2を入力してください
echo ＊それ以外の数字などを入力すると閉じます
set /P Setfile=""

rem フォルダーの場合
if %Setfile%==1 (
 SETLOCAL ENABLEDELAYEDEXPANSION
 set /P pass="フォルダーのパスを入力してください:"
 echo　実行しています.... ＊ログが出ます
 echo run Takeown
 takeown /f !pass!\* /r
 echo run icacls
 icacls !pass!\* /reset /t
 ENDLOCAL
 echo 実行しました。 エラー等が出た場合にはパスが正しいかなどを確認してください
 pause
)

rem ファイルの場合
if %Setfile%==2 (
 rem 遅延環境変数有効化(if文内でsetさせるため)
 SETLOCAL ENABLEDELAYEDEXPANSION
 set /P pass="ファイルのパスを入力してください"
 echo　実行しています.... ＊ログが出ます
 echo run Takeown
 takeown /f !pass!
 echo run icacls
 icacls !pass! /reset
 ENDLOCAL
 echo 実行しました。 エラー等が出た場合にはパスが正しいかなどを確認してください
 pause
)

rem Author:CoreNion Twitter:@CoreiNion