function [aeroForces] = paramSpace_1_3_1_3_1_3_1(sailStates,airStates)

	CL = (3.936681)*sailStates.alpha + (0.023545)*sailStates.beta + (-2.200496)*sailStates.p + (30.785852)*sailStates.q + (-0.009629)*sailStates.r + (0.009976)*sailStates.de;
	CD = -0.104920;
	CY = (-0.100094)*sailStates.alpha + (-0.026671)*sailStates.beta + (0.194169)*sailStates.p + (-0.665001)*sailStates.q + (0.034301)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.050264)*sailStates.alpha + (-0.074030)*sailStates.beta + (-0.910639)*sailStates.p + (6.743669)*sailStates.q + (0.166093)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-14.473026)*sailStates.alpha + (-0.129508)*sailStates.beta + (7.960484)*sailStates.p + (-128.181442)*sailStates.q + (0.112778)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.387883)*sailStates.alpha + (-0.006310)*sailStates.beta + (-0.567230)*sailStates.p + (3.551523)*sailStates.q + (-0.042697)*sailStates.r + (0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end