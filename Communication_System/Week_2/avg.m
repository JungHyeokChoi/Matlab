function [mean,variance] = avg(x)
L = length(x);
z = sum(x);
mean = z/L;
variance = sum((x-mean).^2)/L;
end

