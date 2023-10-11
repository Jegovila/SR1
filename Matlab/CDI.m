clear all
close all

L(1) = Link('alpha', pi/2, 'a', 0, 'd', 0.5);
L(2) = Link('alpha', -pi/2, 'a', 0.5, 'd', 0);
L(3) = Link('alpha', 0, 'a', 0.5, 'd', 0);

bot = SerialLink(L, 'name', 'Mi Robot');

q = [0,0,0];

qd = [pi/2, 0, pi/8];
Td = bot.fkine(qd);

% td(1) = 0.3;
% td(2) = 0.3;
% td(3) = 0.3;

% [R, t] = tr2rt(Td);
% Td = rt2tr(R,td);
xd = tr2delta(Td);

%xd = [0.3,0.3,0.3,0,0,0]'
iter = 200;

%%
for i =1:iter

    T = bot.fkine(q);
    x = tr2delta(T);

    v = xd - x;

    J = bot.jacob0(q);
    %Ji = inv(J);
    Ji = pinv(J);
    %Ji = J';

    qp = 2 * Ji * v;
    %qp = .5 * Ji(:,1:3) * v(1:3);
    %qp = 1 * Ji(:,1:3) * v(1:3);
    q = q + qp';

    q_plot(i,:) = q;
    plott(:,i) = v;

end


%%

bot.plot(q_plot)

figure
hold on

plot(plott(1,:),'b-.','Linewidth',2);
plot(plott(2,:),'r-.','Linewidth',2);
plot(plott(3,:),'g-.','Linewidth',2);
plot(plott(4,:),'m-.','Linewidth',2);
plot(plott(5,:),'y-.','Linewidth',2);
plot(plott(6,:),'k-.','Linewidth',2);

xlabel('t');
ylabel('v,w');
legend('x','y','z','theta_x','theta_y','theta_z');