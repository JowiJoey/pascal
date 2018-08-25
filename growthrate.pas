program GrowthRate (input, output);

uses transcend;

const MaxYears=20;

type LinearArray=array[1..MaxYears] of real;

var PastFigures:LinearArray;
    GrowthFactor, GrowthRate:real;
    Name:string[20];
    NumYears:integer;

{$I ReadReal}
{$I ReadInt}
{$I IntRaise}

procedure InputData;
var j:integer;
    begin
        repeat
            write('Number of years figures establised: ')
        until ReadInt(NumYears,1,MaxYears);
        write('What do your figures represent?');
        readln(Name);
        for i := 1 to NumYears do
            begin
                if i<>1 then write(' ':8);
                repeat
                    write('year ',j:0,': ');
                until ReadReal(PastFigures[j]);
            end;
    end; {procedure InputData}

function AverageGrowthRate:real;
    var CurrentLog, SumLogs, SumFactoredLogs;
        LogGrowthRate:real;
        j:integer;
    begin
        
    end;

