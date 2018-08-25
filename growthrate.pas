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

