program BUBBLGUM;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  M = 1000000;

type
  mas = array [1..M] of Integer;

var
  a: mas;
  n, i, j, x,k: Integer;
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
  Assign(f, name1);
  reset(f);
  readln(f, n);
  for i:= 1 to n do
    read(f, a[i]);
  Close(f);
  T:= Now;
  if (vopr = 'NO') then
    begin
      for i:= 1 to n-1 do
        for j:= n downto i+1 do
          begin
            if a[j-1]>a[j] then
              begin
                x:= a[j-1];
                a[j-1]:=a[j];
                a[j]:=x;
              end;
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
      Writeln(f, 'PUZYREK');
      Writeln(f, floattostr(TSum));
      CloseFile(f);
    end
  else
    begin
      AssignFile(f, name2);
      rewrite(f);
      writeln(f, n);
      for i:= 1 to n-1 do
        for j:= n downto i+1 do
          begin
            if a[j-1]>a[j] then
              begin
                x:= a[j-1];
                a[j-1]:=a[j];
                a[j]:=x;
                for k:= 1 to n do
                  write(f, a[k], ' ');
                writeln(f);
              end;
          end;
      T:= Now-T;
      DecodeTime(T, THour, TMin, TSec, TMilli);
      TSum:= TMilli/1000 + TSec + 60*TMin + 3600*THour;
      Writeln(f, 'BubbleGUMSort');
      Writeln(f, floattostr(TSum));
      CloseFile(f);
    end;
end.
