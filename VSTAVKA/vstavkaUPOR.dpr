program vstavkaUPOR;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const

  M = 1000000;

type

  mas = array [1..M] of Integer;

var
  A: mas;
  n, i, j, x: Integer;
  f: TextFile;
  T: TDateTime;
  name1,name2: string[20];
  THour, TMin, TSec, TMilli: word;
  TSum: double;

begin
  Writeln('Vvedite imya faila s ishodnym massivom');
  Readln(name1);
  Writeln('Vvedite imya vihodnogo faila');
  Readln(name2);
  n:=16384;
  for i:=1 to n do
    a[i]:=i;
  Assignfile(f, name1);
  rewrite(f);
  write(f, n);
  writeln(f);
  for i:=1 to n do
    write(f, a[i],' ');
  Close(f);
  T:= Now;
      for i:=2 to n do
        begin
          x:= a[i];
          j:= i;
          while (j>1) and (x<a[j-1]) do
            begin
              a[j]:= a[j-1];
              j:= j-1;
            end;
          a[j]:= x;
        end;
      T:= Now-T;
      DecodeTime(T, THour, TMin, TSec, TMilli);
      TSum:= TMilli/1000 + TSec + 60*TMin + 3600*THour;
      AssignFile(f, name2);
      rewrite(f);
      writeln(f, n);
      for i:= 1 to n-1 do
        write(f, a[i], ' ');
      writeln(f, a[n]);
      Writeln(f, 'Vstavka');
      Writeln(f, floattostr(TSum));
      CloseFile(f);
end.
