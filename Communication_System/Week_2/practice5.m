n = 20;
sum = 1;
% 초기값 : 증가값 : 최대값
for k = 2:2:n;
    sum = sum * k;
end

fprintf('result = %e \n',sum);

a = rand(1);
if a > 0.5
    fprintf('a = %f \n',a);
end
