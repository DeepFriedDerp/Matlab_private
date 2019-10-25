function [aeroForces] = paramSpace_1_2_1_2_2_3_1(sailStates,airStates)

	CL = (4.109448)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.042155)*sailStates.p + (28.801208)*sailStates.q + (0.267668)*sailStates.r + (0.009827)*sailStates.de;
	CD = -0.307710;
	CY = (-0.082058)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.295721)*sailStates.p + (-0.267956)*sailStates.q + (0.052169)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.051243)*sailStates.alpha + (-0.137174)*sailStates.beta + (-0.831997)*sailStates.p + (5.984676)*sailStates.q + (0.425784)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-14.884680)*sailStates.alpha + (0.000000)*sailStates.beta + (7.628329)*sailStates.p + (-124.628265)*sailStates.q + (-0.813651)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (0.509580)*sailStates.alpha + (-0.024187)*sailStates.beta + (-0.796938)*sailStates.p + (4.247258)*sailStates.q + (-0.039784)*sailStates.r + (0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end