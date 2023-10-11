clear all
close all

%SCARA
L1 = Revolute('a',0.5,'alpha',0,'d',0,'offset',0);
L2 = Revolute('a',0.7,'alpha',pi,'d',0,'offset',0);
L3 = Prismatic('a',0,'alpha',0,'offset',0,'theta',0);
L4 = Revolute('a',0,'alpha',0,'d',0.1,'offset',0);

bot = SerialLink([L1,L2,L3,L4], 'name', 'SCARA');

q = [pi/6, pi/2, .6, .1];

bot.plot(q, 'workspace', [-2 2,-2 2,-2 2])

A1 = bot.A(1,q); %T01
A2 = bot.A(2,q); %T02
A3 = bot.A(3,q); %T03
A4 = bot.A(4,q); %T04
bot.fkine(q);
