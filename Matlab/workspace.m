close all
clear all

L1 = Revolute('a',0.5,'alpha',0,'d',0,'offset',0);
L2 = Revolute('a',0.5,'alpha',pi,'d',0,'offset',0);
L3 = Prismatic('a',0,'alpha',0,'offset',0,'theta',0);
L4 = Revolute('a',0,'alpha',0,'d',0.1,'offset',0);

bot = SerialLink([L1,L2,L3,L4], 'name', 'SCARA');

q = [0 0 0 0];
bot.plot(q, 'workspace', [-2 2 -2 2 -2 2]);

r=1;
for i=0:0.07:pi
    for j=0:0.07:3*pi/2
        for k=0:0.1:0.5
            
            q = [i j k 0];
            T = bot.fkine(q);

            x(r) = T.t(1); 
            y(r) = T.t(2);
            z(r) = T.t(3);
            r = r+1;
        end
    end
end

figure
pcshow([x(:), y(:), z(:)],[1,0,0],'MarkerSize',16)