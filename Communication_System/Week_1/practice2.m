%이전에 실행된 그래프를 지워줌
close all
t = [0:0.1:2*pi];
y = sin(t);
% 선형 그래프
plot(t,y,'b')
hold on
% 막대 그래프(stem도 있음)
bar(t,y,'y')
% 점선
grid on
%  X,Y축의 표시(그리스 기호 사용시 \ 다음에 쓸 것)(첫번째 스펠링만 대문자로 쓰면 대문자로 변형 됨)
xlabel('t (\pi x sec)')
ylabel('y')
title('practice2')
y1 = cos(t);
% 이전 그래프와 다음 그래프를 한 그림에 표시
hold on
plot(t,y1,'r')
% 선형 그래프의 최소, 최대값 조절(X축 최소 X축 최대 Y축 최소 Y축 최대)(순서 유의)  
axis([0 2*pi -1.5 1.5])
% 선형 그래프 설명(그린 순서대로 쓸 것)
legend('sin(t)','sin(t)','cos(t)')