@echo off
rem �Ǘ��Ҍ������m�F�E�����łȂ���ΊǗ��Ҍ����ōċN��
set ThisPath=%~f0
openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 (
    powershell start-process %ThisPath% -verb runas
    exit
) 


echo �����C���c�[��   
echo �����ł́A�t�@�C����t�H���_�[�̌���������Windows�̌����ɖ߂��܂�
echo �t�H���_�[�̏ꍇ��1���A�t�@�C���̏ꍇ��2����͂��Ă�������
echo ������ȊO�̐����Ȃǂ���͂���ƕ��܂�
set /P Setfile=""

rem �t�H���_�[�̏ꍇ
if %Setfile%==1 (
 SETLOCAL ENABLEDELAYEDEXPANSION
 set /P pass="�t�H���_�[�̃p�X����͂��Ă�������:"
 echo�@���s���Ă��܂�.... �����O���o�܂�
 echo run Takeown
 takeown /f !pass!\* /r
 echo run icacls
 icacls !pass!\* /reset /t
 ENDLOCAL
 echo ���s���܂����B �G���[�����o���ꍇ�ɂ̓p�X�����������Ȃǂ��m�F���Ă�������
 pause
)

rem �t�@�C���̏ꍇ
if %Setfile%==2 (
 rem �x�����ϐ��L����(if������set�����邽��)
 SETLOCAL ENABLEDELAYEDEXPANSION
 set /P pass="�t�@�C���̃p�X����͂��Ă�������"
 echo�@���s���Ă��܂�.... �����O���o�܂�
 echo run Takeown
 takeown /f !pass!
 echo run icacls
 icacls !pass! /reset
 ENDLOCAL
 echo ���s���܂����B �G���[�����o���ꍇ�ɂ̓p�X�����������Ȃǂ��m�F���Ă�������
 pause
)

rem Author:CoreNion Twitter:@CoreiNion