#include <stdio.h>
#include <string.h>
#include <stdlib.h>


void Remove();
void Add();
void Help();
void Title();
void Read();
void BreakLine(int numChars,char lineChar);

int main(int argc, char *argv [])
{

    Title();

    if (argc == 1)
    {
        Help();
    }

    if (((strcmp(argv[1],"help")) == 0) || ((strcmp(argv[1],"HELP")) == 0))
    {
        Help();
    }
    
    else if (((strcmp(argv[1],"new")) == 0) || ((strcmp(argv[1],"NEW")) == 0))
    {
        Add();
    }

    else if (((strcmp(argv[1],"remove")) == 0) || ((strcmp(argv[1],"REMOVE")) == 0))
    {
        Remove();
    }

    else if (((strcmp(argv[1],"read")) == 0) || ((strcmp(argv[1],"READ")) == 0))
    {
        Read();
    }
        
}


void Title()
{
            printf("\n Windows 11 TPM bypass tool. V1.0a\n");
            BreakLine(35, '=');
            printf("\n");
}

void Help()
{
    printf("\nThis tool will add or remove the needed regestry key for windows 11 tpm check on install.\nBy running this tool during an install of windows 11 or in window 10 before an upgrade will enable you to add or remove the TPM bypass check on the Windows 11 install.\n\nTo add or remove a TPM bypass key you must be running as an administrator.\n");

    BreakLine(100,'-');

    printf("\n\nW11TPM NEW \t-creates TPM bypess regestry key\nW11TPM REMOVE \t-removes TPM bypass key");
    printf("\nNEW (or) new\t\t= create TPM bypass key\nREMOVE (or) remove\t= deletes TPM bypass key");
    printf("\nREAD (or) read\t\t= check if key exists and the information it holds.");
    printf("\nHELP (or) help\t\t= displays help.\n");

    BreakLine(100,'-');
    printf("\n");
}

void Add()
{
    system("reg add HKLM\\SYSTEM\\Setup\\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1");
}

void Remove()
{
    system("reg delete HKLM\\SYSTEM\\Setup\\LabConfig /v BypassTPMCheck");
}

void Read()
{
    system("reg query HKLM\\SYSTEM\\Setup\\LabConfig /v BypassTPMCheck");
}

void BreakLine(int numChars,char lineChar)
{
    for (int i = 0; i < numChars; i++)
    {
        printf("%c",lineChar);
    }            
}




