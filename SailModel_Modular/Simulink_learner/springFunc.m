function [xdot] = springFunc(t,x)

	m = 1;
	k = 5;
	b = 1;

	xdot(1) = x(2);
	xdot(2) = -(b*x(2) + k*x(1))/m;

	xdot = xdot';

end