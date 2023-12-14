function [predictchar] = spelling(i,j)
a = min(i,j);
b = max(i,j);
j = a;
i = b;
i = i-6;
spellmatrix = ['A' 'B' 'C' 'D' 'E' 'F'; 'G' 'H' 'I' 'J' 'K' 'L'; 'M' 'N' 'O' 'P' 'Q' 'R'; 'S' 'T' 'U' 'V' 'W' 'X'; 'Y' 'Z' '1' '2' '3' '4'; '5' '6' '7' '8' '9' '_'];
predictchar = spellmatrix(i,j);
