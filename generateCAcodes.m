function ca = generateCAcodes(PRN)
% Generate GPS L1 C/A code for PRN 1..32
% Output: 1x1023 vector with values +/-1

g2s = [
    2 6; 3 7; 4 8; 5 9; 1 9; 2 10; 1 8; 2 9;
    3 10; 2 3; 3 4; 5 6; 6 7; 7 8; 8 9; 9 10;
    1 4; 2 5; 3 6; 4 7; 5 8; 6 9; 1 3; 4 6;
    5 7; 6 8; 7 9; 8 10; 1 6; 2 7; 3 8; 4 9
];

if PRN < 1 || PRN > 32
    error('PRN must be between 1 and 32.');
end

g1 = -1 * ones(1,10);
g2 = -1 * ones(1,10);
ca = zeros(1,1023);

tap1 = g2s(PRN,1);
tap2 = g2s(PRN,2);

for i = 1:1023
    g1_out = g1(10);
    g2_out = g2(tap1) * g2(tap2);
    ca(i) = g1_out * g2_out;

    g1_feedback = g1(3) * g1(10);
    g2_feedback = g2(2) * g2(3) * g2(6) * g2(8) * g2(9) * g2(10);

    g1 = [g1_feedback g1(1:9)];
    g2 = [g2_feedback g2(1:9)];
end
end