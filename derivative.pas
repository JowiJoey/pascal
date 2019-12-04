program Derivative (input,output);

const limit = 10;

type index = 1..limit;

var PointX:real;

function FofX(PointX:real):real;
begin
    FofX:=sqr(PointX) + cos(PointX)
end;

function Inc(Exp:integer):real;
const Alpha=5.0E-1;
var j:index;
    temp:real;

begin
    Temp:=1;
    for j := 1 to Exp do
        Temp:=Temp*Alpha;
    Inc:=Temp;
end;

procedure Calculate;
var Delta,SubDelta,Value:real;
i:index;

begin
    Delta:=0;
    for i := 1 to limit do begin
        SubDelta:=Delta;
        Value:=PointX + Inc(i);
        Delta:=(FofX(Value) - FofX(PointX)) / (Value - PointX);            
    writeln('         is', ((2 * Delta) - SubDelta):3:6);
    writeln;
end;

begin {MAIN}
writeln;
writeln('Derivative');
writeln;writeln;
repeat
    writeln;
    writeln('Derivative at X = ');
    readln(PointX);
    Calculate;
    writeln;
until (NotAgain);
end. {MAIN}
