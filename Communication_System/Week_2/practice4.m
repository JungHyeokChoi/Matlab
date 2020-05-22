[x,y] = meshgrid(-1:0.1:1);
z = 1 - (x.^2 + y.^2);
mesh(x,y,z);
title('Mesh test');