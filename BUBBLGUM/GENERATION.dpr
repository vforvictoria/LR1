program GENERATION;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const

M = 1000000;

type

mas = array [1..M] of Integer;

var
A: mas;
n,i: Integer;
f: TextFile;
name: string[20];

begin
Writeln('Vvedite razmer massiva');
Readln(N);
Writeln('Vvedite imya faila v korotyj zapisat massiv');
Readln(name);
randomize;
for i:= 1 to n do
A[i]:= random(1000000)-500000;
AssignFile(f, name);
rewrite(f);
Write(f, n);
Writeln(f);
for i:= 1 to n do
Write(f, a[i],' ');
Close(f);
end.


