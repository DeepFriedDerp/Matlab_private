function [aeroForces] = paramSpace_1_3_1_1_3_3_3(sailStates,airStates)

	CL = (4.756602)*sailStates.alpha + (-0.186947)*sailStates.beta + (-3.148533)*sailStates.p + (35.489159)*sailStates.q + (0.621957)*sailStates.r + (0.009523)*sailStates.de;
	CD = -1.450270;
	CY = (0.428660)*sailStates.alpha + (-0.018576)*sailStates.beta + (0.458981)*sailStates.p + (2.260756)*sailStates.q + (0.080716)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.238896)*sailStates.alpha + (-0.346191)*sailStates.beta + (-1.753373)*sailStates.p + (14.236707)*sailStates.q + (0.858372)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-13.872989)*sailStates.alpha + (0.736027)*sailStates.beta + (11.847315)*sailStates.p + (-156.476898)*sailStates.q + (-1.994493)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (-0.580352)*sailStates.alpha + (-0.051226)*sailStates.beta + (-1.411386)*sailStates.p + (5.912514)*sailStates.q + (-0.042809)*sailStates.r + (-0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end