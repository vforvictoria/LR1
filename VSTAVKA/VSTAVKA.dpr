program VSTAVKA;

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
  name1,name2,vopr: string[20];
  THour, TMin, TSec, TMilli: word;
  TSum: double;

begin
  name1:=paramstr(1);
  name2:=paramstr(2);
  Writeln('Vvedite YES esli poshagovo, NO - esli kak obichno');
  Readln(vopr);
  Assignfile(f, name1);
  reset(f);
  readln(f, n);
  for i:= 1 to n do
    read(f, a[i]);
  Close(f);
  T:= Now;
  if (vopr = 'NO') then
    begin
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
      Writeln(f, 'Vstavochka');
      Writeln(f, floattostr(TSum));
      CloseFile(f);
    end
  else
    begin
      AssignFile(f, name2);
      rewrite(f);
      writeln(f, n);
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
          for j:= 1 to n do
            write(f, a[j], '  ');
          writeln(f);
        end;
      T:= Now-T;
      DecodeTime(T, THour, TMin, TSec, TMilli);
     TSum:= TMilli/1000 + TSec + 60*TMin + 3600*THour;
      Writeln(f, 'Vstavochka');
      Writeln(f, floattostr(TSum));
      CloseFile(f);
    end;
end.
