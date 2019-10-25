function [aeroForces] = paramSpace_1_1_1_1_3_3_3(sailStates,airStates)

	CL = (4.756603)*sailStates.alpha + (0.186947)*sailStates.beta + (-3.148533)*sailStates.p + (35.489155)*sailStates.q + (0.621956)*sailStates.r + (0.009523)*sailStates.de;
	CD = -1.450270;
	CY = (0.428660)*sailStates.alpha + (-0.031086)*sailStates.beta + (0.458981)*sailStates.p + (2.260756)*sailStates.q + (0.080716)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.353070)*sailStates.alpha + (-0.291727)*sailStates.beta + (-1.837991)*sailStates.p + (15.297569)*sailStates.q + (0.843350)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-13.872991)*sailStates.alpha + (-0.736027)*sailStates.beta + (11.847315)*sailStates.p + (-156.476898)*sailStates.q + (-1.994491)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (-0.636747)*sailStates.alpha + (-0.061257)*sailStates.beta + (-1.426306)*sailStates.p + (6.099572)*sailStates.q + (-0.045457)*sailStates.r + (-0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end