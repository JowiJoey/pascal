program GrowthRate (input, output);
const MaxYears = 20;
type LinearArray = array[1..MaxYears] of real;
var PastFigures:LinearArray;
    GrowFactor, GrowRate:real;
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
       SumLogs:=ln(PastFigures[1]);
       SumFactoredLogs := 0;
       for k := 2 to NumYears do
            begin
                CurrentLog := ln(PastFigures[k]);
                SumLogs := SumLogs + CurrentLog;
                SumFactoredLogs := SumFactoredLogs + (j-1) * CurrentLog;
            end;
        LogGrowthRate := 6 * (2 * SumFactoredLogs / (NumYears - 1) - SumLogs) / NumYears / (NumYears + 1);
        GrowRate := exp(LogGrowthRate) - 1;
        GrowFactor := exp(SumLogs / NumYears - LogGrowthRate * (NumYears - 1) / 2);
        AverageGrowthRate := trunc(GrowRate * 10000 + 0.5 / 100);            
    end; {function CalcGrowthRate}

procedure ProjectFigures;
    var year:integer;
        ProjFigure:real;
    begin
        writeln('Enter 0 to End Growth Rate Programe');
        repeat
            write('projected ', Name, 'for years: ')
        until ReadInt(year, 0, maxint);
        if year <> 0 then
            begin
                ProjFigure := GrowFactor * IntRaise (1 + GrowRate, year - 1);
                writeln('=':27, trunc(ProjFigure * 100 + 0.5) / 100);
            end;
        until year = 0;
    end; {procedure ProjectFigures}

begin {main}
    writeln;
    writeln('Average Growth Rate, Future Projections');
    writeln;
    InputData;
    writeln('Average Growth Rate = ', AverageGrowthRate, ' %');
    writeln;
    ProjectFigures;
end;
