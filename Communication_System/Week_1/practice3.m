close all
x = [0.01:0.01:2];
y = exp(x);
z = log(x);

plot(x,y)
hold on
plot(x,z)
legend('exp(x)','log(x)')
grid on
title('practice3')
xlabel('x','b')
ylabel('y','r')
axis([0 2 -4 7])
