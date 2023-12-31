syms c1 s1 c2 s2 d3 c4 s4 c5 s5 c6 s6 d2 d6

a1 = [c1 0 -s1 0;s1 0 c1 0; 0 -1 0 0;0 0 0 1];
a2 = [c2 0 s2 0;s2 0 -c2 0;0 1 0 d2;0 0 0 1];
a3 = [1 0 0 0;0 1 0 0;0 0 1 d3;0 0 0 1];
a4 = [c4 0 -s4 0;s4 0 c4 0;0 -1 0 0;0 0 0 1];
a5 = [c5 0 s5 0;s5 0 -c5 0;0 1 0 0;0 0 0 1];
a6 = [c6 -s6 0 0; s6 c6 0 0;0 0 1 d6;0 0 0 1];

T01 = a1;
T02 = T01 * a2;
T03 = T02 * a3;
T04 = T03 * a4;
T05 = T04 * a5;
T06 = T05 * a6;

Z0 = [0;0;1]; % Inicializaci[on
Z1 = T01(1:3,3);
Z2 = T02(1:3,3);
Z3 = T03(1:3,3);
Z4 = T04(1:3,3);
Z5 = T05(1:3,3);
Z6 = T06(1:3,3);

P0 = [0;0;0]; %Inicializaci[on
P1 = T01(1:3,4);
P2 = T02(1:3,4);
P3 = T03(1:3,4);
P4 = T04(1:3,4);
P5 = T05(1:3,4);
P6 = T06(1:3,4);

Jp1 = simplify(cross(Z0,(P6-P0)));
Jo1 = Z0;

Jp2 = simplify(cross(Z1,(P6-P1)));
Jo2 = Z1;

Jp3 = Z2;
Jo3 = [0;0;0];

Jp4 = simplify(cross(Z3,(P6-P3)));
Jo4 = Z3;

Jp5 = simplify(cross(Z4,(P6-P4)));
Jo5 = Z4;

Jp6 = simplify(cross(Z5,(P6-P5)));
Jo6 = Z5;

J = [Jp1 Jp2 Jp3 Jp4 Jp5 Jp6;
    Jo1 Jo2 Jo3 Jo4 Jo5 Jo6];
